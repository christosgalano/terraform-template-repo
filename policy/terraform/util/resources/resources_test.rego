package terraform.util.resources_test

import data.terraform.util.resources as r

rc(type, actions) := {
	"address": $"{type}.this",
	"mode": "managed",
	"type": type,
	"change": {"actions": actions, "after": {"name": "x"}, "after_unknown": {}},
}

plan := {"resource_changes": [
	rc("example_server", ["create"]),
	rc("example_bucket", ["update"]),
	rc("example_network", ["delete"]),
	rc("example_address", ["no-op"]),
	object.union(rc("example_image", ["read"]), {"mode": "data"}),
]}

test_changed_keeps_creates_and_updates if {
	types := {c.type | some c in r.changed(plan)}
	types == {"example_server", "example_bucket"}
}

test_changed_includes_replacements if {
	replaced := {"resource_changes": [rc("example_server", ["delete", "create"])]}
	count(r.changed(replaced)) == 1
}

test_changed_by_type if {
	count(r.changed_by_type("example_server", plan)) == 1
	count(r.changed_by_type("example_network", plan)) == 0
}

test_changed_by_types if {
	count(r.changed_by_types({"example_server", "example_bucket"}, plan)) == 2
}

test_known if {
	r.known(rc("example_server", ["create"]), "name")
}

test_unknown if {
	unknown := object.union(rc("example_server", ["create"]), {"change": {"after": {"name": null}, "after_unknown": {"name": true}}})
	not r.known(unknown, "name")
}

test_message if {
	r.message(rc("example_server", ["create"]), "bad") == "example_server.this: bad"
}
