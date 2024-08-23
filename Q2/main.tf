# Write a Terraform script to create an S3 bucket. Include configuration to set the bucket’s versioning to “enabled”.


terraform {
  backend "s3" {
    bucket = "backupstate-terraform"
    key    = "terraform-Q2/terraform.tfstate"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "bucketB" {
    bucket = var.name
    tags = {
        Name = var.tag_name
        Environment = var.tag_env
    }


    #<----------------- One of doing the versioning using only versioning---------------->
    
    # versioning {
    #   enabled = true
    # }
}
# <-------------------Another way doing versioning using the resource block code--------------------->

# resource "aws_s3_bucket_versioning" "versioning_example" {
#   bucket = aws_s3_bucket.bucketB.bucket
#   versioning_configuration {
#     status = "Enabled"
#   }
# }