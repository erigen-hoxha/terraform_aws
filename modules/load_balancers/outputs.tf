output "public_lb_dns" {
  value       = aws_lb.public_lb.dns_name
  description = "DNS name of the public ALB"
}

output "internal_lb_dns" {
  value       = aws_lb.internal_lb.dns_name
  description = "DNS name of the internal ELB"
}

output "public_lb_arn" {
  value       = aws_lb.public_lb.arn
  description = "ARN of the public ALB"
}

output "internal_lb_arn" {
  value       = aws_lb.internal_lb.arn
  description = "ARN of the internal ELB"
}

output "public_lb_zone_id" {
  value       = aws_lb.public_lb.zone_id
  description = "Zone ID of the public ALB"
}

output "internal_lb_zone_id" {
  value       = aws_lb.internal_lb.zone_id
  description = "Zone ID of the internal ELB"
}
