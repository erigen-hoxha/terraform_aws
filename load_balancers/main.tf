resource "aws_lb" "public_lb" {
  name               = "public-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
}

resource "aws_lb" "internal_lb" {
  name               = "internal-elb"
  internal           = true
  load_balancer_type = "network"
  subnets            = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
}
