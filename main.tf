provider "aws" {

region = "ap-south-1"

}

module "server" {
source = "git::https://github.com/CloudSihmar/terraform-aws-ec2-webserver.git"

type = "t2.micro"
}

