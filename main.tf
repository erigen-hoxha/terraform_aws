# In this block is called the VPC module
module "vpc" {
  source = "./modules/vpc"
}

# In this block is called the Load Balancers module
module "load_balancers" {
  source = "./modules/load_balancers"
  public_subnets           = [module.vpc.public_subnet_1, module.vpc.public_subnet_2]
  internal_subnets         = [module.vpc.private_subnet_1, module.vpc.private_subnet_2]
  security_groups          = module.security_groups.lb_sg_id
}

# In this block is called the Autoscaling module
module "autoscaling" {
  source = "./modules/autoscaling"
  ec2_ami                 = var.ec2_ami
  ec2_instance_type       = var.ec2_instance_type
  asg_desired_capacity    = var.asg_desired_capacity
  asg_max_size            = var.asg_max_size
  asg_min_size            = var.asg_min_size
  cpu_high_threshold      = var.cpu_high_threshold
  cpu_low_threshold       = var.cpu_low_threshold
  cooldown_period         = var.cooldown_period
  public_subnets          = [module.vpc.public_subnet_1, module.vpc.public_subnet_2]
  web_sg_id               = module.security_groups.web_sg_id
}

# In this block is called the ECS Fargate module
module "ecs_fargate" {
  source = "./modules/ecs_fargate"
  ecs_memory               = var.ecs_memory
  ecs_cpu                  = var.ecs_cpu
  ecs_desired_count        = var.ecs_desired_count
  api_image                = var.api_image
  subnets                  = [module.vpc.private_subnet_1, module.vpc.private_subnet_2]
  security_groups          = [module.security_groups.api_sg_id]
}

# In this block is called the RDS module
module "rds" {
  source = "./modules/rds"
  vpc_security_group_ids      = [module.security_groups.rds_sg_id]
  subnet_ids                  = [module.vpc.private_subnet_1, module.vpc.private_subnet_2]
}

# In this block is called the Security Groups module
module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}
