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
    on_failure   = contains(local.rollback_options, var.on_failure) ? var.on_failure : "ROLLBACK"
    iam_role_arn = var.iam_role_arn == "" ? null : var.iam_role_arn
  }

  parameters = var.parameters == {} ? null : var.parameters
  stack_tags = merge(var.tags, var.tags_custom, module.template_data.template_tags)

  allow_rules_file = var.allow_rules_file == "" ? null : data.local_file.firewall_rules[0].content

  allow_rules = {
    AllowRules = var.parameters.AllowRules == "" ? local.allow_rules_file : var.parameters.AllowRules
  }
  stack_parameters = merge(local.parameters, local.allow_rules)
}
