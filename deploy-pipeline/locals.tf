locals {
  rollback_options = [
    "DO_NOTHING",
    "ROLLBACK",
    "DELETE"
  ]

  template_url = "${var.template_url}?versionId=${module.template_data.version_id}"

  stack = {
    name         = var.stack_name
    template_url = local.template_url
    policy_url   = var.policy_url == "" ? null : var.policy_url
    capabilities = length(var.capabilities) == 0 ? null : var.capabilities
    on_failure   = contains(local.rollback_options, var.on_failure) ? var.on_failure : null
    iam_role_arn = var.iam_role_arn == "" ? null : var.iam_role_arn
  }

  parameters = var.parameters == {} ? null : var.parameters
  stack_tags = merge(var.tags, var.tags_custom, module.template_data.template_tags)
}
