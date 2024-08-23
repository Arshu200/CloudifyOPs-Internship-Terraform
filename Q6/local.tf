# locals {
#   ingress = [{
#     description = "Allow the SSH"
#     port        = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   },{
#     port        = 80
#     protocol    = "tcp"
#     description = "Allow the HTTP"
#     cidr_blocks = ["0.0.0.0/0"]
#   }]

#     description = "Allow the Outbound Rules"
#     port        = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
# }
