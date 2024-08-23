# 10.Create a module that optionally provisions an AWS S3 bucket based on a boolean variable create_bucket. If create_bucket is true, the S3 bucket should be created; otherwise, it should not be created.

terraform {
  backend "s3" {
    bucket = "backupstate-terraform"
    key    = "terraformQ10/terraform.tfstate"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = "ap-south-1"
}

module "module" {
  source = "./module"
}