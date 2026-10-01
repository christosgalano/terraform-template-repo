# METADATA
# scope: package
# description: |
#   Taggable resources carry the house tags, so cost and ownership can be traced.
#   Works across providers: it reads tags_all (AWS), tags (most providers) or
#   labels (Google). Provider default tags normally take care of this; the rule
#   catches a root module that forgets them.
# entrypoint: true
package terraform.common.tags

import data.terraform.util.resources

# Edit to match your conventions. Keys are compared case-insensitively.
_required := {"project", "environment", "owner"}

_attributes := ["tags_all", "tags", "labels"]

# METADATA
# title: Required tags.
# description: Taggable resources must carry the project, environment and owner tags.
deny contains msg if {
	some rc in resources.changed(input)
	_judgeable(rc)
	present := {lower(key) | some key, _ in _tags(rc.change.after)}
	missing := _required - present
	count(missing) > 0
	msg := sprintf("%s (missing: %s)", [
		resources.message(rc, rego.metadata.rule().description),
		concat(", ", sort(missing)),
	])
}

# Taggable means the resource has a tags attribute. If any of them is only known
# after apply (typical for tags_all) we cannot judge it, so leave it alone.
_judgeable(rc) if {
	some attribute in _attributes
	attribute in object.keys(rc.change.after)
	every attribute in _attributes {
		not rc.change.after_unknown[attribute]
	}
}

_tags(after) := object.union_n([after[attribute] |
	some attribute in _attributes
	is_object(after[attribute])
])
