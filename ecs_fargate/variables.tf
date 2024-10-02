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
