variable "network_configuration" {
  description = "Network configuration for the ECS service"
  type = object({
    subnets         = list(string)
    security_groups = list(string)
  })
}

variable "target_group_arn" {
  description = "ARN of the target group for the load balancer"
}

variable "ecs_memory" {
  default = "512"
}

variable "ecs_cpu" {
  default = "256"
}

variable "ecs_desired_count" {
  default = 2
}

variable "api_image" {
  default = "nginx"
}
