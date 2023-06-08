resource "aws_instance" "server" {

    ami = var.ami
    instance_type = var.type
    vpc_security_group_ids = [aws_security_group.main.id]
    associate_public_ip_address = true

    user_data = <<-EOF
      #!/bin/sh
      sudo apt-get update -u
      sudo apt install -y nginx
      sudo systemctl start nginx
      sudo echo "<html><body><h1>Hello this is module-1 at instance id `curl http://169.254.169.254/latest/meta-data/instance-id` </h1></body></html>" > /var/www/html/index.html
      EOF

tags = {
  Name = "git-server"
}
}

