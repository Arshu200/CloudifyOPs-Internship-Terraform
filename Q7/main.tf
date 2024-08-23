# 7.Use a data source to retrieve the details of an existing security group and apply it to a new EC2 instance.
terraform {
  backend "s3" {
    bucket = "backupstate-terraform"
    key    = "terraformQ7/terraform.tfstate"
    region = "ap-south-1"
  }
}


provider "aws" {
  region = "ap-south-1"
}

resource "aws_key_pair" "example" {
  key_name   = "my-key-pair"
  public_key = file("C:/Users/hp/Desktop/TerraformDemo/my-key-pair.pub")
}


data "aws_security_group" "s_group" {
  filter {
    name   = "group-name"
    # securitygroup id
    values = ["testing"] 
  }
}

resource "aws_instance" "my_instance" {
  ami           = "ami-0ad21ae1d0696ad58"
  instance_type = "t2.micro"
  vpc_security_group_ids = [data.aws_security_group.s_group.id]
  key_name      = "my-key-pair"
}
