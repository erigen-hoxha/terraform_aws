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

resource "aws_autoscaling_policy" "scale_up" {
  name                   = "scale-up-policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.web_asg.name
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = "scale-down-policy"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.web_asg.name
}

resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "high-cpu-utilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 70
  alarm_description   = "Alarm when CPU exceeds 70% utilization"
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.web_asg.name
  }

  alarm_actions = [aws_autoscaling_policy.scale_up.arn]
}

resource "aws_cloudwatch_metric_alarm" "low_cpu" {
  alarm_name          = "low-cpu-utilization"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 30
  alarm_description   = "Alarm when CPU falls below 30% utilization"
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.web_asg.name
  }

  alarm_actions = [aws_autoscaling_policy.scale_down.arn]
}
