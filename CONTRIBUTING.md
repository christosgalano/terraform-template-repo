# Contributing

Issues and pull requests are welcome: bugs, unclear docs, and ideas for the template. For a new feature, open an issue first so we can agree it fits.

By taking part you agree to the [Code of Conduct](https://github.com/christosgalano/.github/blob/main/CODE_OF_CONDUCT.md).

## Making a change

1. Fork, branch, change.
2. Run the checks locally: `pre-commit run --all-files`, then `opa test policy` and `terraform test` in any module or stack you touched.
3. Update the docs a change affects, including `assets/` if the pipeline changed.
4. Open a pull request that says what changed and why. CI must pass.

Keep the template provider-neutral: no cloud-specific resources, actions or policies outside commented examples.
