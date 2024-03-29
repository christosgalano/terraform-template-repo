# Dependencies

In order to keep up with our Terraform and GitHub Actions dependencies, we use Dependabot with the following [configuration](../.github/dependabot.yaml):

```yaml
version: 2
updates:
  - package-ecosystem: "terraform"
    directory: "/terraform"
    schedule:
      interval: "daily" # only on weekdays
      time: "23:00"
      timezone: "Europe/Athens"
    target-branch: "main"
    open-pull-requests-limit: 3
    pull-request-branch-name:
      separator: "/"

  - package-ecosystem: "github-actions"
    # Workflow files stored in the default location of `.github/workflows`
    directory: "/"
    schedule:
      interval: "weekly"
      day: "sunday"
    target-branch: "main"
    open-pull-requests-limit: 3
    pull-request-branch-name:
      separator: "/"
```
