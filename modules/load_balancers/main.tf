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

#Target group for Load Balancer to forward requests to the ECS service
resource "aws_lb_target_group" "api_target_group" {
  name     = "api-target-group"
  port     = 3001
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold  = 2
    unhealthy_threshold = 2
  }
}

#Listener rules for the Load Balancer
resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.public_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"

    target_group_arn = aws_lb_target_group.api_target_group.arn
  }
}
