output "ecs_service_name" {
  value = aws_ecs_service.api_service.name
  description = "Name of the ECS service"
}

output "ecs_service_arn" {
  value = aws_ecs_service.api_service.arn
  description = "ARN of the ECS service"
}

output "ecs_cluster_id" {
  value = aws_ecs_cluster.api_cluster.id
  description = "ID of the ECS cluster"
}

output "task_definition_arn" {
  value = aws_ecs_task_definition.api_task.arn
  description = "ARN of the ECS task definition"
}
