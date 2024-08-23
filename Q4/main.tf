# 4.Create a Terraform script for an EC2 instance that uses variables for the AMI ID, instance type, and tags. Also, define outputs for the instance ID and public IP address.

#<---------------Initialing the backend------------------>
terraform {
  backend "s3" {
    bucket = "backupstate-terraform"
    key    = "terraformQ4/terraform.tfstate"
    region = "ap-south-1"
  }
}

# <------------provider Block------------>
provider "aws" {
  region = "ap-south-1"
}

# <----------resource Block---------->
resource "aws_instance" "i1" {
  ami = var.ami
  instance_type = var.type
  tags={
    Name = var.name
  }
}