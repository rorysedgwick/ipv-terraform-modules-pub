resource "aws_cloudformation_stack" "deploy" {
  name         = local.stack.name
  parameters   = local.stack_parameters
  template_url = local.stack.template_url
  policy_url   = local.stack.policy_url
  capabilities = local.stack.capabilities
  on_failure   = local.stack.on_failure
  iam_role_arn = local.stack.iam_role_arn

  tags = local.stack_tags
}
