output "asg_name" {
  value       = aws_autoscaling_group.web_asg.name
  description = "Name of the Auto Scaling Group"
}

output "scale_up_policy_arn" {
  value       = aws_autoscaling_policy.scale_up.arn
  description = "ARN of the scale-up policy"
}

output "scale_down_policy_arn" {
  value       = aws_autoscaling_policy.scale_down.arn
  description = "ARN of the scale-down policy"
}

output "high_cpu_alarm_name" {
  value       = aws_cloudwatch_metric_alarm.high_cpu.alarm_name
  description = "Name of the high CPU utilization alarm"
}

output "low_cpu_alarm_name" {
  value       = aws_cloudwatch_metric_alarm.low_cpu.alarm_name
  description = "Name of the low CPU utilization alarm"
}
