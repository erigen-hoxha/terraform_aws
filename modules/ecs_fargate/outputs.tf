output "ecs_service_name" {
  value = aws_ecs_service.api_service.name
  description = "Name of the ECS service"
}

output "ecs_service_arn" {
  value = aws_ecs_service.api_service.arn
  description = "ARN of the ECS service"
}
