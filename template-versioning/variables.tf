variable "template" {
  type = object({
    bucket  = optional(string, "template-storage-templatebucket-1upzyw6v9cs42")
    version = optional(string, "latest")
    object  = string
  })
}
