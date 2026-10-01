package terraform.common.tags_test

import data.terraform.common.tags

house_tags := {"project": "acme", "environment": "dev", "owner": "platform"}

rc(after, after_unknown) := {
	"address": "module.stack.example_network.this",
	"mode": "managed",
	"type": "example_network",
	"change": {"actions": ["create"], "after": after, "after_unknown": after_unknown},
}

denials(resource) := result if {
	result := tags.deny with input as {"resource_changes": [resource]}
}

test_all_tags_present if {
	count(denials(rc({"tags": house_tags}, {}))) == 0
}

test_labels_attribute_supported if {
	count(denials(rc({"labels": house_tags}, {}))) == 0
}

test_tags_all_wins_over_tags if {
	count(denials(rc({"tags": {}, "tags_all": house_tags}, {}))) == 0
}

test_key_case_ignored if {
	count(denials(rc({"tags": {"Project": "acme", "ENVIRONMENT": "dev", "Owner": "platform"}}, {}))) == 0
}

test_extra_tags_fine if {
	count(denials(rc({"tags": object.union(house_tags, {"name": "x"})}, {}))) == 0
}

test_missing_tags_listed if {
	some msg in denials(rc({"tags": {"project": "acme"}}, {}))
	contains(msg, "missing: environment, owner")
}

test_null_tags_denied if {
	count(denials(rc({"tags": null}, {}))) == 1
}

test_untaggable_resource_ignored if {
	count(denials(rc({"name": "x"}, {}))) == 0
}

test_unknown_tags_ignored if {
	count(denials(rc({"tags": null, "tags_all": null}, {"tags_all": true}))) == 0
}

test_deleted_resource_ignored if {
	deleted := object.union(rc({"tags": {}}, {}), {"change": {"actions": ["delete"]}})
	count(denials(deleted)) == 0
}
