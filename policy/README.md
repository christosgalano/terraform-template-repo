# Policy

[Rego](https://www.openpolicyagent.org/docs/policy-language) rules that [conftest](https://www.conftest.dev) evaluates against the Terraform plan (`terraform show -json`) in CI and CD. Static scanners judge the code; these judge what Terraform is about to do, with every module, variable and `for_each` resolved.

```text
policy/terraform/
  util/resources/     helpers for picking resources out of a plan
  common/tags/        provider-neutral example rule: required tags or labels
  <provider>/<entity>/   your rules, e.g. aws/security_group/
```

Each rule package has a `_test.rego` next to it. CI runs `opa fmt`, `regal lint` and `opa test`, and fails below 90% coverage.

## Writing a rule

1. Create `policy/terraform/<provider>/<entity>/<entity>.rego` with `package terraform.<provider>.<entity>`.
2. Select resources with `data.terraform.util.resources` (`changed_by_type` and friends) and add a `deny contains msg if { ... }` rule. Use `resources.message(rc, description)` so the finding names the exact resource.
3. Add `<entity>_test.rego` with a passing case and a failing case per rule.
4. `opa test policy -v`

Rules only see resources being created or updated. A value that is only known after apply can't be judged, so check it with `resources.known` and leave it alone otherwise.

## Local use

```sh
terraform -chdir=terraform/environments/development plan -out=tfplan
terraform -chdir=terraform/environments/development show -json tfplan > plan.json
conftest test plan.json --policy policy --all-namespaces
```

## Going further

This folder is enough to start. For a complete policy practice (naming and layout conventions, scenario policies, publishing policies as an OPA bundle, Copilot skills for writing and reviewing Rego), use [opa-template-repo](https://github.com/christosgalano/opa-template-repo) and consume its bundle or copy its policies here.
