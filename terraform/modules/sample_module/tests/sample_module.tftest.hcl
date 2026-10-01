# Unit tests. With a real provider, add `mock_provider "<name>" {}` so the tests
# need no credentials and create nothing.

variables {
  name = "acme-test"
}

run "carries_name_and_labels" {
  command = plan

  variables {
    labels = { owner = "platform" }
  }

  assert {
    condition     = terraform_data.this.input.name == "acme-test"
    error_message = "The resource must carry the name it was given."
  }

  assert {
    condition     = terraform_data.this.input.labels.owner == "platform"
    error_message = "Labels must be passed through."
  }
}

run "rejects_invalid_name" {
  command = plan

  variables {
    name = "Not Valid"
  }

  expect_failures = [var.name]
}
