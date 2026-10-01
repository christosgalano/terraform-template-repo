#!/usr/bin/env bash
# Works out what a change touches, so CI and CD test and plan only what they have to.
#
#   modules/<m> changed                         ->  test <m>, test every stack, plan every environment
#   stacks/<s> changed                          ->  test <s>, plan every environment
#   environments/<e> changed                    ->  plan <e>
#   tests/ folders                              ->  test that unit only, nothing to plan
#   *.md                                        ->  nothing
#   policy/, .github/, trivy.yaml, .tflint.hcl  ->  plan every environment (the gates themselves changed)
#
# Usage: changes.sh <base-sha> [head-sha]
#   An empty or all-zero base (first push, new branch) plans every environment.
# Writes `units` and `environments` (JSON arrays) to $GITHUB_OUTPUT.
# Environments come out in promotion order, see ORDER.
set -euo pipefail

# Promotion order: earlier environments are deployed first. Environments not
# listed here follow alphabetically.
ORDER=(development staging production)

base=${1:-}
head=${2:-HEAD}

all_envs=$(find terraform/environments -mindepth 1 -maxdepth 1 -type d | sort)
all_stacks=$(find terraform/stacks -mindepth 1 -maxdepth 1 -type d | sort)

units=()
envs=()
plan_all=false

if [ -z "${base//0/}" ]; then
  echo "No base commit: planning every environment."
  files=""
  plan_all=true
else
  files=$(git diff --name-only "${base}...${head}")
  echo "Changed files:"
  sed 's/^/  /' <<<"${files}"
fi

while IFS= read -r f; do
  [ -z "$f" ] && continue
  case "$f" in
    *.md) ;;
    terraform/modules/*/tests/* | terraform/stacks/*/tests/*)
      units+=("$(cut -d/ -f1-3 <<<"$f")")
      ;;
    terraform/modules/*)
      units+=("$(cut -d/ -f1-3 <<<"$f")")
      while IFS= read -r s; do units+=("$s"); done <<<"${all_stacks}"
      plan_all=true
      ;;
    terraform/stacks/*)
      units+=("$(cut -d/ -f1-3 <<<"$f")")
      plan_all=true
      ;;
    terraform/environments/*)
      envs+=("$(cut -d/ -f3 <<<"$f")")
      ;;
    policy/* | .github/* | trivy.yaml | .tflint.hcl)
      plan_all=true
      ;;
  esac
done <<<"${files}"

if [ "${plan_all}" = true ]; then
  while IFS= read -r e; do envs+=("$(basename "$e")"); done <<<"${all_envs}"
fi

# Only units that actually have tests, and only environments that still exist.
tested=()
for u in "${units[@]+"${units[@]}"}"; do
  [ -d "$u/tests" ] && tested+=("$u")
done
existing=()
for e in "${envs[@]+"${envs[@]}"}"; do
  [ -d "terraform/environments/$e" ] && existing+=("$e")
done

in_promotion_order() {
  local names
  names=$(printf '%s\n' "$@" | sort -u)
  for e in "${ORDER[@]}"; do grep -Fx -- "$e" <<<"${names}" || true; done
  grep -Fxv -f <(printf '%s\n' "${ORDER[@]}") <<<"${names}" || true
}

to_json() { jq -Rnc '[inputs | select(length > 0)]'; }
units_json=$(printf '%s\n' "${tested[@]+"${tested[@]}"}" | sort -u | to_json)
envs_json=$(in_promotion_order "${existing[@]+"${existing[@]}"}" | to_json)

echo "Test units:   ${units_json}"
echo "Environments: ${envs_json}"
{
  echo "units=${units_json}"
  echo "environments=${envs_json}"
} >> "${GITHUB_OUTPUT:-/dev/stdout}"
