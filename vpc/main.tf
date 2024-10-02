resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id                   = aws_vpc.main_vpc.id
  cidr_block               = var.public_subnet_cidr_1
  availability_zone        = "us-east-1a"
  map_public_ip_on_launch  = true
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id                   = aws_vpc.main_vpc.id
  cidr_block               = var.private_subnet_cidr_1
  availability_zone        = "us-east-1a"
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                   = aws_vpc.main_vpc.id
  cidr_block               = var.public_subnet_cidr_2
  availability_zone        = "us-east-1b"
  map_public_ip_on_launch  = true
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id                   = aws_vpc.main_vpc.id
  cidr_block               = var.private_subnet_cidr_2
  availability_zone        = "us-east-1b"
}
