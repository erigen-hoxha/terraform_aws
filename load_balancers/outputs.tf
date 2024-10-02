output "public_lb_dns" {
  value = aws_lb.public_lb.dns_name
  description = "DNS name of the public ALB"
}

output "internal_lb_dns" {
  value = aws_lb.internal_lb.dns_name
  description = "DNS name of the internal ELB"
}