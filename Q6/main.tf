# # 6.Deploy an EC2 instance and use the remote-exec provisioner to SSH into the instance and install Apache HTTP Server.

# terraform {
#   backend "s3" {
#     bucket = "backupstate-terraform"
#     key    = "terraformQ6/terraform.tfstate"
#     region = "ap-south-1"
#   }
# }

# provider "aws" {
#   region = "ap-south-1"
# }

# resource "aws_instance" "web" {
#   ami  = var.ami
#   instance_type = var.type
#   vpc_security_group_ids = [aws_security_group.sg-web.name]

#   tags          ={
#         Name    = var.name
#   }
# #   <------------provisioners------------->
#   provisioner "remote-exec" {

#     connection {
#       type     = "ssh"
#       user     ="ubuntu"
#       private_key = file("C:/Users/hp/Desktop/TerraformDemo/Arshad_Demo.pem")
#       host = self.public_ip
#       timeout = "3m"
#     }

#     inline = [ 
#     "sudo apt-get update -y",
#     "sudo apt-get install -y apache2",
#     "sudo systemctl start apache2",
#     "sudo systemctl enable apache2",
#     # Create a simple HTML website
#     "echo '<!DOCTYPE html>' > /var/www/html/index.html",
#     "echo '<html>' >> /var/www/html/index.html",
#     "echo '<head>' >> /var/www/html/index.html",
#     "echo '<title>Welcome to My Website</title>' >> /var/www/html/index.html",
#     "echo '<style>' >> /var/www/html/index.html",
#     "echo 'body { font-family: Arial, sans-serif; background-color: #f4f4f4; text-align: center; padding: 50px; }' >> /var/www/html/index.html",
#     "echo 'h1 { color: #333; }' >> /var/www/html/index.html",
#     "echo 'p { color: #666; }' >> /var/www/html/index.html",
#     "echo '.container { max-width: 600px; margin: 0 auto; background: #fff; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }' >> /var/www/html/index.html",
#     "echo '</style>' >> /var/www/html/index.html",
#     "echo '</head>' >> /var/www/html/index.html",
#     "echo '<body>' >> /var/www/html/index.html",
#     "echo '<div class=\"container\">' >> /var/www/html/index.html",
#     "echo '<h1>Welcome to My Website!</h1>' >> /var/www/html/index.html",
#     "echo '<p>This is a simple web page deployed using Terraform.</p>' >> /var/www/html/index.html",
#     "echo '</div>' >> /var/www/html/index.html",
#     "echo '</body>' >> /var/www/html/index.html",
#     "echo '</html>' >> /var/www/html/index.html" 
#      ]  
#   }
# }

# resource "aws_security_group" "sg-web" {
#   name        = "web-sg"
#   description = "Allow the SSH and HTTP Traffic"

#   egress{
#     description = local.description
#     from_port   = local.port
#     to_port     = local.port
#     protocol    = local.protocol
#     cidr_blocks = local.cidr_blocks
#   }

#   dynamic "ingress" {
#     for_each = local.ingress

#     content {
#       description = ingress.value.description
#       from_port   = ingress.value.port
#       to_port     = ingress.value.port
#       protocol    = ingress.value.protocol
#       cidr_blocks = ingress.value.cidr_blocks
#     }
#   }

#   tags = {
#     Name = "SSH-HTTP-SG"
#   }

# }



terraform {
  backend "s3" {
    bucket = "backupstate-terraform"
    key    = "terraformQ6/terraform.tfstate"
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

resource "aws_security_group" "sg-web" {
  name        = "web-sg"
  description = "Allow SSH and HTTP traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SSH-HTTP-SG"
  }
}

resource "aws_instance" "web" {
  ami                    = var.ami
  instance_type          = var.type
  vpc_security_group_ids = [aws_security_group.sg-web.name]
  key_name               = aws_key_pair.example.key_name

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("C:/Users/hp/Desktop/TerraformDemo/my-key-pair")
      host        = self.public_ip
      timeout     = "5m" # Increased timeout
    }

    inline = [
      # Create a bash script on the instance
      "cat << 'EOF' > /tmp/setup_web.sh",
      "#!/bin/bash",
      "apt update -y",
      "apt install apache2 -y",
      "systemctl start apache2",
      "systemctl enable apache2",
      "mkdir -p /var/www/html",
      "cat <<EOT > /var/www/html/index.html",
      "<!DOCTYPE html>",
      "<html lang=\"en\">",
      "<head>",
      "    <meta charset=\"UTF-8\">",
      "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">",
      "    <title>Welcome to My Website</title>",
      "    <style>",
      "        body {",
      "            font-family: Arial, sans-serif;",
      "            margin: 0;",
      "            padding: 0;",
      "            background-color: #f4f4f4;",
      "            color: #333;",
      "        }",
      "        header {",
      "            background-color: #4CAF50;",
      "            color: white;",
      "            padding: 10px 0;",
      "            text-align: center;",
      "        }",
      "        nav {",
      "            background-color: #333;",
      "            color: white;",
      "            padding: 15px;",
      "            text-align: center;",
      "        }",
      "        nav a {",
      "            color: white;",
      "            padding: 14px 20px;",
      "            text-decoration: none;",
      "            margin: 0 10px;",
      "        }",
      "        nav a:hover {",
      "            background-color: #ddd;",
      "            color: black;",
      "        }",
      "        main {",
      "            padding: 20px;",
      "            text-align: center;",
      "        }",
      "        footer {",
      "            background-color: #333;",
      "            color: white;",
      "            padding: 10px 0;",
      "            text-align: center;",
      "            position: fixed;",
      "            bottom: 0;",
      "            width: 100%;",
      "        }",
      "    </style>",
      "</head>",
      "<body>",
      "    <header>",
      "        <h1>Welcome to My Website</h1>",
      "    </header>",
      "    <nav>",
      "        <a href=\"#\">Home</a>",
      "        <a href=\"#\">About</a>",
      "        <a href=\"#\">Services</a>",
      "        <a href=\"#\">Contact</a>",
      "    </nav>",
      "    <main>",
      "        <h2>Hello, World!</h2>",
      "        <p>This is a simple yet elegant webpage hosted on an Apache2 server.</p>",
      "    </main>",
      "    <footer>",
      "        <p>&copy; 2024 My Website. All rights reserved.</p>",
      "    </footer>",
      "</body>",
      "</html>",
      "EOT",
      "EOF",
      # Make the script executable
      "chmod +x /tmp/setup_web.sh",

      # # Run the script
      "sudo /tmp/setup_web.sh"
    ]
  }
  tags = {
    Name = var.name
  }
}
