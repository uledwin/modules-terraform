provider "aws" {
  region = "us-east-1"

}

resource "aws_instance" "instance-platzi" {
  #ami           = "ami-003b0d38bfcd4187d"
  ami             = var.aws_ami_id
  instance_type   = var.aws_instance_type
  tags            = var.aws_tags
  security_groups = ["${aws_security_group.ssh_connection.name}"]
}

resource "aws_security_group" "ssh_connection" {
  name        = var.aws_sg_name
  description = "Allow ingres by ssh"
  #vpc_id      = aws_vpc.main.id

  dynamic "ingress" {
    for_each = var.aws_sg_ingress_rule
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]
  }

  # tags = {
  #   Name = "allow_tls"
  # }
}

terraform {
  
}