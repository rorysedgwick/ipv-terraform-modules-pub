output "stack_id" {
  value = aws_cloudformation_stack.deploy.id
}

output "stack_outputs" {
  value = aws_cloudformation_stack.deploy.outputs
}

output "stack_tags" {
  value = aws_cloudformation_stack.deploy.tags_all
}

output "github_role_arn" {
  value = contains(["dev", "build"], var.parameters.Environment) ? aws_cloudformation_stack.deploy.outputs.GitHubActionsRoleArn : null
}

output "source_bucket_name" {
  value = contains(["dev", "build"], var.parameters.Environment) ? aws_cloudformation_stack.deploy.outputs.GitHubArtifactSourceBucketName : null
}

output "promotion_bucket_arn" {
  value = var.parameters.IncludePromotion == "Yes" ? aws_cloudformation_stack.deploy.outputs.ArtifactPromotionBucketArn : null
}

output "promotion_event_trigger_role_arn" {
  value = var.parameters.IncludePromotion == "Yes" ? aws_cloudformation_stack.deploy.outputs.ArtifactPromotionBucketEventTriggerRoleArn : null
}
