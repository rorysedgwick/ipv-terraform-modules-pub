locals {
  rollback_options = [
    "DO_NOTHING",
    "ROLLBACK",
    "DELETE"
  ]

  stack = {
    name         = var.stack_name
    template_url = var.template_url
    policy_url   = var.policy_url == "" ? null : var.policy_url
    capabilities = var.capabilities == [] ? null : var.capabilities
    on_failure   = contains(local.rollback_options, var.on_failure) ? var.on_failure : "ROLLBACK"
    iam_role_arn = var.iam_role_arn == "" ? null : var.iam_role_arn
  }

  parameters = var.parameters == {} ? null : var.parameters
  stack_tags = merge(var.tags, var.tags_custom)
}
