resource "aws_ecs_cluster" "api_cluster" {
  name = "api-cluster"
}

resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole"

  # Assume role policy for ECS
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_ecs_task_definition" "api_task" {
  family                   = "api-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  memory                   = var.ecs_memory
  cpu                      = var.ecs_cpu
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  container_definitions    = jsonencode([
    {
      name      = "api-container"
      image     = var.api_image
      cpu       = var.ecs_cpu
      memory    = var.ecs_memory
      portMappings = [
        {
          containerPort = 3001
          hostPort      = 3001
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "api_service" {
  cluster         = aws_ecs_cluster.api_cluster.id
  task_definition = aws_ecs_task_definition.api_task.arn
  desired_count   = var.ecs_desired_count
  launch_type     = "FARGATE"
  network_configuration {
    subnets         = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
    security_groups = [aws_security_group.api_sg.id]
  }
}
