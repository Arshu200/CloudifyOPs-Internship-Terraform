# 5.Write a Terraform script to create an IAM role with an attached policy that grants S3 read-only access.

terraform {
  backend "s3" {
    bucket = "backupstate-terraform"
    key    = "terraformQ5/terraform.tfstate"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = "ap-south-1"
}

# resource "aws_iam_role" "s3_role" {
#   name = "s3_role"

#   # Terraform's "jsonencode" function converts a
#   # Terraform expression result to valid JSON syntax.
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         # Sid    = ""
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#       },
#     ]
#   })

#   tags = {
#     tag-key = "tag-value"
#   }
# }


resource "aws_iam_role" "readrole" {
    name = "s3-readrole"
    assume_role_policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
            {
                Action = "sts:AssumeRole",
                Effect = "Allow",
                Principal = {
                    Service = "ec2.amazonaws.com"
                }
            },
        ]
    })

}


resource "aws_iam_policy" "s3_read_only_policy" {
    name = "s3-read-policy"

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
      {
        Effect   = "Allow",
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ],
        
        Resource = "arn:aws:s3:::backupstate-terraform"
      },
    ]
    }) 
}


resource "aws_iam_role_policy_attachment" "s3_read_only_policy_attachment" {
    role = aws_iam_role.readrole.name
    policy_arn = aws_iam_policy.s3_read_only_policy.arn
  
}
