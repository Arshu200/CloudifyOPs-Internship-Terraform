# 8.Utilize the terraform-aws-modules/s3-bucket/aws module from the Terraform Registry to create an S3 bucket with versioning enabled. Ensure you configure the bucket's name and enable versioning.

terraform {
  backend "s3" {
    bucket = "backupstate-terraform"
    key    = "terraformQ8/terraform.tfstate"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = "ap-south-1"
}

# module "s3_bucket" {
#   source = "terraform-aws-modules/s3-bucket/aws"

#   bucket = "my-s3-bucket-11test77"
#   versioning = {
#     enabled = true
#   }
# }

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = var.bucket
  versioning = {
    enabled = true
  }
}


variable "bucket" {
  default = "my-s3-bucket-11test77"
}