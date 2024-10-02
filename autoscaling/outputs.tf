# Output the Auto Scaling Group name

output "asg_name" {
  value = aws_autoscaling_group.web_asg.name
  description = "Name of the Auto Scaling Group"
}