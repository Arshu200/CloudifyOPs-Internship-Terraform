variable "create_bucket" {
  description = "Set to true to create the S3 bucket."
  type        = bool
  default     = true
}

variable "bucket_name" {
  description = "The name of the S3 bucket."
  type        = string
  default = "111testing666"
}

variable "acl" {
  description = "The ACL for the S3 bucket."
  type        = string
  default     = "private"
}

variable "tags" {
  description = "A map of tags to assign to the bucket."
  type        = map(string)
  default     = {}
}
