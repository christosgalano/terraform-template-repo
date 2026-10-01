# METADATA
# scope: package
# description: Helpers for selecting resources from a Terraform plan (terraform show -json).
package terraform.util.resources

# METADATA
# title: Resources being created or updated.
# description: Managed resources whose planned actions include create or update. Deletes and no-ops are ignored.
changed(plan) := [rc |
	some rc in plan.resource_changes
	rc.mode == "managed"
	some action in rc.change.actions
	action in {"create", "update"}
]

# METADATA
# title: Changed resources of a given type.
# description: Resources of the given type that are being created or updated.
changed_by_type(type, plan) := [rc |
	some rc in changed(plan)
	rc.type == type
]

# METADATA
# title: Changed resources of any of the given types.
# description: Resources of any type in the given set that are being created or updated.
changed_by_types(types, plan) := [rc |
	some rc in changed(plan)
	rc.type in types
]

# METADATA
# title: Is an attribute known at plan time.
# description: False when Terraform marks the attribute as "known after apply".
known(rc, attribute) if {
	not rc.change.after_unknown[attribute]
	rc.change.after[attribute] != null
}

# METADATA
# title: Format a violation message.
# description: Prefixes a rule description with the resource address, so findings point at the exact resource.
message(rc, description) := sprintf("%s: %s", [rc.address, description])
