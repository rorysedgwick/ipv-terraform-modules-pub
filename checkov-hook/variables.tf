variable "stack_name" {
  type = string
}

variable "template_url" {
  type    = string
  default = "https://template-storage-templatebucket-1upzyw6v9cs42.s3.amazonaws.com/checkov-hook/template.yaml"
}

variable "policy_url" {
  type    = string
  default = ""
}

variable "capabilities" {
  type    = list(string)
  default = ["CAPABILITY_IAM"]
}

variable "on_failure" {
  type    = string
  default = "ROLLBACK"
}

variable "iam_role_arn" {
  type    = string
  default = ""
}

variable "parameters" {
  description = "A Map of parameters to pass to the CloudFormation template at runtime"
  type = object({
    CheckovRulesToSkip = string
  })

  default = {
    CheckovRulesToSkip = "CKV_AWS_7,CKV_AWS_18,CKV_AWS_111"
  }
}

variable "tags" {
  type = object({
    Product     = string
    System      = string
    Environment = string
  })

  default = {
    Product     = "GOV.UK Sign In"
    System      = "Authentication"
    Environment = "build"
  }
}

variable "tags_custom" {
  description = "Optional custom resource tags"
  type        = map(string)
  default     = {}
}
