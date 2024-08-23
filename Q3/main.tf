# Create a Terraform script to provision an EC2 instance called test2  along with a security group that allows inbound SSH (port 22) and HTTP (port 80) traffic. 

terraform {
  backend "s3" {
    bucket = "backupstate-terraform"
    key    = "terraformQ3/terraform.tfstate"
    region = local.region
  }
}

# <--------------Providers Block------------>
provider "aws" {
  region = local.region
}


# <------------Without dynamic block------------->

# resource "aws_security_group" "SG" {
#    name   = "Securtiy_Group_demo"
   

#    ingress {
#       description = "ingress_rule_1"
#       from_port   = 22
#       to_port     = 22
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#    }
   
#    ingress {
#       description = "ingress_rule_2"
#       from_port   = 80
#       to_port     = 80
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#    }

#    tags = {
#       Name = "SG-Demo-TF"
#    }
# }



# <------------With dynamic block------------->

resource "aws_security_group" "SG" {
   name   = "Securtiy_Group_demo"
   
  dynamic "ingress" {
      for_each = local.ingress_rules

      content {
         description = ingress.value.description
         from_port   = ingress.value.port
         to_port     = ingress.value.port
         protocol    = "tcp"
         cidr_blocks = ["0.0.0.0/0"]
      }
   }
   tags = {
      Name = "SG-Demo-TF"
   }
}

# <------------Creating the Instance-------------->
resource "aws_instance" "instance1" {
    ami = var.ami
    instance_type = var.type
    security_groups = [aws_security_group.SG.name]
    tags = {
      Name = var.tag
    }
}






