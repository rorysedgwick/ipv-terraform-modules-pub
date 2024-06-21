variable "stack_name" {
  type = string
}

variable "template_url" {
  type    = string
  default = "https://template-storage-templatebucket-1upzyw6v9cs42.s3.amazonaws.com/vpc/template.yaml"
}

variable "template_data" {
  type = object({
    bucket  = optional(string, "template-storage-templatebucket-1upzyw6v9cs42")
    version = optional(string, "v2.5.19")
    object  = optional(string, "vpc/template.yaml")
  })

  default = {
    bucket  = "template-storage-templatebucket-1upzyw6v9cs42"
    version = "v2.5.19"
    object  = "vpc/template.yaml"
  }
}

variable "policy_url" {
  type    = string
  default = ""
}

variable "capabilities" {
  type    = list(string)
  default = ["CAPABILITY_AUTO_EXPAND", "CAPABILITY_IAM"]
}

variable "on_failure" {
  type    = string
  default = "ROLLBACK"
}

variable "iam_role_arn" {
  type    = string
  default = ""
}

variable "allow_rules_file" {
  type    = string
  default = ""
}

variable "parameters" {
  description = "A Map of parameters to pass to the CloudFormation template at runtime"
  type = object({
    CidrBlock                         = optional(string, "10.0.0.0/16")
    AvailabilityZoneCount             = optional(number, 2)
    ZoneAEIPAllocationId              = optional(string, "none")
    ZoneBEIPAllocationId              = optional(string, "none")
    ZoneCEIPAllocationId              = optional(string, "none")
    VpcLinkEnabled                    = optional(string, "No")
    AllowedDomains                    = optional(string, "none")
    AllowRules                        = optional(string, "")
    LogsApiEnabled                    = optional(string, "No")
    CodeBuildApiEnabled               = optional(string, "No")
    BatchApiEnabled                   = optional(string, "No")
    CloudWatchApiEnabled              = optional(string, "No")
    CloudWatchLogsApiEnabled          = optional(string, "No")
    GlueApiEnabled                    = optional(string, "No")
    XRayApiEnabled                    = optional(string, "No")
    SSMApiEnabled                     = optional(string, "No")
    SecretsManagerApiEnabled          = optional(string, "No")
    KMSApiEnabled                     = optional(string, "No")
    DynamoDBApiEnabled                = optional(string, "No")
    AthenaApiEnabled                  = optional(string, "No")
    S3ApiEnabled                      = optional(string, "No")
    SQSApiEnabled                     = optional(string, "No")
    SNSApiEnabled                     = optional(string, "No")
    KinesisApiEnabled                 = optional(string, "No")
    FirehoseApiEnabled                = optional(string, "No")
    EventsApiEnabled                  = optional(string, "No")
    StatesApiEnabled                  = optional(string, "No")
    ECRApiEnabled                     = optional(string, "No")
    LambdaApiEnabled                  = optional(string, "No")
    CodeDeployApiEnabled              = optional(string, "No")
    ExecuteApiGatewayEnabled          = optional(string, "No")
    TextractApiEnabled                = optional(string, "No")
    CloudFormationEndpointEnabled     = optional(string, "No")
    SESSmtpEnabled                    = optional(string, "No")
    STSApiEnabled                     = optional(string, "No")
    SSMParametersStoreEnabled         = optional(string, "No")
    DynatraceApiEnabled               = optional(string, "No")
    RestAPIGWVpcLinkEnabled           = optional(string, "No")
    AccessLogsCustomBucketNameEnabled = optional(string, "Yes")
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
