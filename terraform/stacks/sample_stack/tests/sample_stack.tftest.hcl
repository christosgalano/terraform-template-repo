# Stack tests check the wiring, not the modules (those have their own tests).

variables {
  name   = "acme-test"
  labels = { environment = "test" }
}

run "wires_the_module" {
  command = plan

  assert {
    condition     = module.sample.name == "acme-test"
    error_message = "The stack must pass its name to the module."
  }
}
