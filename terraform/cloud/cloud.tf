terraform {
  backend "s3" {
    bucket = "ghe-tf-demo"
    key    = "state/cloud"
    region = "us-west-2"
  }
}

provider "aws" {
  access_key = "${var.aws_access_key_id}"
  secret_key = "${var.aws_secret_access_key}"
  region     = "${var.aws_default_region}"
}

resource "aws_vpc" "ghe-tf-demo" {
  cidr_block           = "172.16.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "ghe-tf-demo"
  }
}

resource "aws_route_table" "ghe-tf-demo" {
  vpc_id = "${aws_vpc.ghe-tf-demo.id}"

  route = {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.ghe-tf-demo.id}"
  }

  tags = {
    Name = "ghe-tf-demo"
  }
}

resource "aws_subnet" "ghe-tf-demo" {
  vpc_id     = "${aws_vpc.ghe-tf-demo.id}"
  cidr_block = "172.16.100.0/24"

  tags = {
    Name = "ghe-tf-demo"
  }
}

resource "aws_route_table_association" "ghe-tf-demo" {
  subnet_id      = "${aws_subnet.ghe-tf-demo.id}"
  route_table_id = "${aws_route_table.ghe-tf-demo.id}"
}

resource "aws_security_group" "ghe-tf-demo" {
  vpc_id = "${aws_vpc.ghe-tf-demo.id}"
  name   = "ghe-tf-demo"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ghe-tf-demo"
  }
}

resource "aws_internet_gateway" "ghe-tf-demo" {
  vpc_id = "${aws_vpc.ghe-tf-demo.id}"

  tags = {
    Name = "ghe-tf-demo"
  }
}

resource "aws_instance" "ghe-tf-demo" {
  ami = "ami-07b2d567"
  instance_type = "r3.large"
  subnet_id = "${aws_subnet.ghe-tf-demo.id}"
  vpc_security_group_ids = [ "${aws_security_group.ghe-tf-demo.id}" ]
  associate_public_ip_address = true
  ebs_block_device = {
    device_name = "/dev/sdb"
    volume_type = "standard"
    volume_size = 20
    delete_on_termination = true
  }
  tags = {
    Name = "ghe-tf-demo"
  }
}
