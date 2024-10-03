variable "ec2_ami" {
  default = "ami-xxxxxxxx"
}

variable "ec2_instance_type" {
  default = "t2.micro"
}

variable "asg_desired_capacity" {
  default = 2
}

variable "asg_max_size" {
  default = 3
}

variable "asg_min_size" {
  default = 1
}
