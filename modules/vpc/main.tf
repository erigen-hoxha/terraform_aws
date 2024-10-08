resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
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
