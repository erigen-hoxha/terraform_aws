# In this block is called the VPC module
module "vpc" {
  source = "./modules/vpc"
}

# In this block is called the Load Balancers module
module "load_balancers" {
  source = "./modules/load_balancers"
  vpc_id = module.vpc.vpc_id
  subnets = module.vpc.public_subnet_ids
}

# In this block is called the Autoscaling module
module "autoscaling" {
  source = "./modules/autoscaling"
}

# In this block is called the ECS Fargate module
module "ecs_fargate" {
  source = "./modules/ecs_fargate"
}

# In this block is called the RDS module
module "rds" {
  source = "./modules/rds"
}

# In this block is called the Security Groups module
module "security_groups" {
  source = "./modules/security_groups"
}
