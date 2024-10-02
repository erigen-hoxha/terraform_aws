resource "aws_launch_configuration" "web_lc" {
  name          = "web-client-lc"
  image_id      = var.ec2_ami
  instance_type = var.ec2_instance_type
  security_groups = [aws_security_group.web_sg.id]
}

resource "aws_autoscaling_group" "web_asg" {
  desired_capacity     = var.asg_desired_capacity
  max_size             = var.asg_max_size
  min_size             = var.asg_min_size
  vpc_zone_identifier  = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
  launch_configuration = aws_launch_configuration.web_lc.id
}