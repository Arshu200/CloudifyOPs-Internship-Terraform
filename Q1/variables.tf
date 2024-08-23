variable "region" {
  description = "AWS region to deploy resources"
  default     = "ap-south-1"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

# variable "s3_bucket" {
#   description = "S3 bucket name for storing the Terraform state"
# }

# variable "s3_key" {
#   description = "S3 key (file path) for the Terraform state"
#   default     = "terraform/terraform.tfstate"
# }
