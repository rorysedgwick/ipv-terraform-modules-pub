variable "stack_name" {
  type = string
}

variable "template_url" {
  type    = string
  default = "https://template-storage-templatebucket-1upzyw6v9cs42.s3.amazonaws.com/sam-deploy-pipeline/template.yaml"
}

variable "template_data" {
  type = object({
    bucket  = optional(string, "template-storage-templatebucket-1upzyw6v9cs42")
    version = optional(string, "latest")
    object  = optional(string, "sam-deploy-pipeline/template.yaml")
  })

  default = {
    bucket  = "template-storage-templatebucket-1upzyw6v9cs42"
    version = "latest"
    object  = "sam-deploy-pipeline/template.yaml"
  }
}

variable "policy_url" {
  type    = string
  default = ""
}

variable "capabilities" {
  type    = list(string)
  default = ["CAPABILITY_NAMED_IAM"]
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
    SAMStackName                            = string
    Environment                             = string
    VpcStackName                            = string
    RequireManualApproval                   = optional(string, "No")
    IncludePromotion                        = optional(string, "Yes")
    AllowedAccounts                         = optional(string, "")
    AWSOrganizationId                       = optional(string, "o-pjzf8d99ys,o-dpp53lco28")
    LogRetentionDays                        = optional(number, 7)
    ContainerSignerKmsKeyArn                = optional(string, "none")
    SigningProfileArn                       = string
    SigningProfileVersionArn                = string
    ArtifactSourceBucketArn                 = optional(string, "none")
    GitHubRepositoryName                    = optional(string, "none")
    TestImageRepositoryUri                  = optional(string, "none")
    TestReportFormat                        = optional(string, "JUNITXML")
    SlackNotificationType                   = optional(string, "None")
    BuildNotificationStackName              = optional(string, "none")
    TruncatedPipelineStackName              = optional(string, "none")
    ProgrammaticPermissionsBoundary         = optional(string, "False")
    AllowedServiceOne                       = optional(string, "none")
    AllowedServiceTwo                       = optional(string, "none")
    AllowedServiceThree                     = optional(string, "none")
    AllowedServiceFour                      = optional(string, "none")
    AllowedServiceFive                      = optional(string, "none")
    AllowedServiceSix                       = optional(string, "none")
    AllowedServiceSeven                     = optional(string, "none")
    DynamicResourcesPrefix                  = optional(string, "none")
    CustomKmsKeyArns                        = optional(string, "")
    AdditionalCodeSigningVersionArns        = optional(string, "none")
    InvokableLambdaAccounts                 = optional(string, "")
    ArtifactSourceBucketEventTriggerRoleArn = optional(string, "none")
    OneLoginRepositoryName                  = optional(string, "none")
    RequireTestContainerSignatureValidation = optional(string, "No")
    TestCoverageReportFormat                = optional(string, "CLOVERXML")
    TestComputeType                         = optional(string, "BUILD_GENERAL1_SMALL")
    RunTestContainerInVPC                   = optional(string, "False")
    ArtifactWriteTimeLoggingLambdaArn       = optional(string, "None")
    AbortOnCheckovFailure                   = optional(string, "CONTINUE")
    AccessLogsCustomBucketNameEnabled       = optional(string, "Yes")
    PipelineEnvironmentNameEnabled          = optional(string, "No")
    ECSCanaryDeployment                     = optional(string, "None")
    LambdaCanaryDeployment                  = optional(string, "None")
    TrafficTestImageRepositoryUri           = optional(string, "none")
  })
}

variable "tags" {
  description = "A Map of tags - with optional default values"
  type = object({
    Product     = optional(string, "GOV.UK Sign In")
    System      = optional(string, "Authentication")
    Environment = optional(string, "build")
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
