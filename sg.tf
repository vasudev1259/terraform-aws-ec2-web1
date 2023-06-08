resource "aws_security_group" "main" {
    name        = "EC2-webserver-SG-1"
  description = "Webserver for EC2 Instances"
  ingress {
    from_port   = 80
    protocol    = "TCP"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    protocol    = "TCP"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
root@ip-172-31-5-178:~/main/terraform-aws-ec2-webserver# cat variable.tf
variable "ami" {
type = string
default = "ami-0f5ee92e2d63afc18"
}

variable "type" {
type = string
default = "t2.medium"
}

