terraform {
  backend "s3" {
    bucket = "backupstate-terraform"
    key    = "terraformQ9/terraform.tfstate"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = "ap-south-1"
}

# resource "aws_key_pair" "example" {
#   key_name   = "my-key-pair"
#   public_key = file("C:/Users/hp/Desktop/TerraformDemo/my-key-pair.pub")
# }

module "instance" {
  source        = "./module/instance"
  ami           = var.ami
  type          = var.type
  name          = var.tag_name
}