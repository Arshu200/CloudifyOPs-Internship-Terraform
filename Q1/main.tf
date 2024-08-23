# Write a Terraform script to create an EC2 instance using the t2.micro instance type and a specific AMI. Make sure to tag the instance with the name test1.


terraform {
  backend "s3" {
    bucket = "backupstate-terraform"
    key    = "terraformQ1/terraform.tfstate"
    region = "ap-south-1"
  }
}

# Configure the AWS provider
provider "aws" {
  region = var.region
}

# Create the EC2 instance
resource "aws_instance" "test1" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "test1"
  }
}
