variable "ec2_ami" {
  description = "AMI ID for the EC2 instances"
  default     = "ami-xxxxxxxx"
}

variable "ec2_instance_type" {
  description = "Instance type for the EC2 instances"
  default     = "t2.micro"
}

variable "asg_desired_capacity" {
  description = "Desired capacity of the Auto Scaling Group"
  default     = 2
}

variable "asg_max_size" {
  description = "Maximum size of the Auto Scaling Group"
  default     = 3
}

variable "asg_min_size" {
  description = "Minimum size of the Auto Scaling Group"
  default     = 1
}

variable "cpu_high_threshold" {
  description = "CPU utilization threshold for scaling up"
  default     = 70
}

variable "cpu_low_threshold" {
  description = "CPU utilization threshold for scaling down"
  default     = 30
}

variable "cooldown_period" {
  description = "Cooldown period for scaling policies (in seconds)"
  default     = 300
}
