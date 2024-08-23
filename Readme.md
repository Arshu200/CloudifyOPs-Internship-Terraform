Pre-requisites:
Store the state file in S3
Make use of variables		

path = /mnt/c/Users/hp/Desktop/TerraformDemo/Questions/Q3

Questions:
1.Write a Terraform script to create an EC2 instance using the t2.micro instance type and a specific AMI. Make sure to tag the instance with the name test1.

2.Write a Terraform script to create an S3 bucket. Include configuration to set the bucket’s versioning to “enabled”.

3.Create a Terraform script to provision an EC2 instance called test2  along with a security group that allows inbound SSH (port 22) and HTTP (port 80) traffic.

4.Create a Terraform script for an EC2 instance that uses variables for the AMI ID, instance type, and tags. Also, define outputs for the instance ID and public IP address.

5.Write a Terraform script to create an IAM role with an attached policy that grants S3 read-only access.

6.Deploy an EC2 instance and use the remote-exec provisioner to SSH into the instance and install Apache HTTP Server.

7.Use a data source to retrieve the details of an existing security group and apply it to a new EC2 instance.

8.Utilize the terraform-aws-modules/s3-bucket/aws module from the Terraform Registry to create an S3 bucket with versioning enabled. Ensure you configure the bucket's name and enable versioning.

9.Create a custom module that launches an EC2 instance and creates a security group that allows SSH access. Use this module in a root module to launch the instance with the security group.

10.Create a module that optionally provisions an AWS S3 bucket based on a boolean variable create_bucket. If create_bucket is true, the S3 bucket should be created; otherwise, it should not be created.		