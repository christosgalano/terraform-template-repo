# Environment management

## Add a new environment

### Directory

Create a directory with the name of the environment in `terraform/environments`. Follow the structure below:

```bash
📦new_environment
 ┣ 📜.terraform-docs.yaml
 ┣ 📜main.tf
 ┣ 📜outputs.tf
 ┣ 📜README.md
 ┣ 📜terraform.tf
 ┗ 📜...
```

You can copy the `.terraform-docs.yaml` from an existing environment, it requires no modifications. You can also skip the creation of the `README.md` since it will be automatically generated when the `ci` workflow runs.

### Workflow

Update the [`ci`](../.github/workflows/ci.yaml) workflow in the `select-environments` job:

```yaml
- name: Find which environment/s changed
  if: github.event_name == 'pull_request'
  uses: dorny/paths-filter@v2
  id: filter
  with:
    filters: |
      modules:
        - '**/modules/**'
      development:
        - '**/development/**'
      staging:
        - '**/staging/**'
      production:
        - '**/production/**'
      new_environment:                  <== Added
        - '**/new_environment/**'

- name: Select environments
  id: select-environments
  run: |
    environments=()
    if [ "${{ steps.filter.outputs.development }}" == "true" ]; then
      environments+=("development")
    fi
    if [ "${{ steps.filter.outputs.new_environment }}" == "true" ]; then        <== Added
      environments+=("new_environment")
    fi
    if [ "${{ steps.filter.outputs.staging }}" == "true" ]; then
      environments+=("staging")
    fi
    if [ "${{ steps.filter.outputs.production }}" == "true" ]; then
      environments+=("production")
    fi
    if [ "${{ steps.filter.outputs.modules }}" == "true" ] || [ "${{ github.event_name }}" == "workflow_dispatch" ]; then
      environments=("development" "staging" "production" "new_environment")
    fi
    environments_json=$(jq -c -n '$ARGS.positional' --args "${environments[@]}")
    echo "Selected environments: $environments_json"
    echo "environments=$environments_json" >> $GITHUB_OUTPUT
```

---

### Example

Let's say we wish to add a new environment called `qa`.

We create a new directory in `terraform/environments` with the following structure:

```bash
📦qa
 ┣ 📜.terraform-docs.yaml
 ┣ 📜qa.auto.tfvars
 ┣ 📜main.tf
 ┣ 📜outputs.tf
 ┣ 📜terraform.tf
 ┗ 📜...
```

```yaml
- name: Find which environment/s changed
  if: github.event_name == 'pull_request'
  uses: dorny/paths-filter@v2
  id: filter
  with:
    filters: |
      modules:
        - '**/modules/**'
      development:
        - '**/development/**'
      qa:
        - '**/qa/**'
      staging:
        - '**/staging/**'
      production:
        - '**/production/**'

- name: Select environments
  if: github.event_name == 'pull_request'
  id: select-environments
  run: |
    environments=()
    if [ "${{ steps.filter.outputs.development }}" == "true" ]; then
      environments+=("development")
    fi
    if [ "${{ steps.filter.outputs.qa }}" == "true" ]; then
      environments+=("qa")
    fi
    if [ "${{ steps.filter.outputs.staging }}" == "true" ]; then
      environments+=("staging")
    fi
    if [ "${{ steps.filter.outputs.production }}" == "true" ]; then
      environments+=("production")
    fi
    if [ "${{ steps.filter.outputs.modules }}" == "true" ] || [ "${{ github.event_name }}" == "workflow_dispatch" ]; then
      environments=("development" "staging" "qa" "production")
    fi
    environments_json=$(jq -c -n '$ARGS.positional' --args "${environments[@]}")
    echo "Selected environments: $environments_json"
    echo "environments=$environments_json" >> $GITHUB_OUTPUT
```

## Remove an environment

If you wish to remove an environment the process is straightforward. Simply:

- delete the environment's directory
- remove the environment's appearance in the [`ci`](../.github/workflows/ci.yaml) workflow
