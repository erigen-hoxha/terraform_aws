variable "rds_allocated_storage" {
  default = 20
}

variable "rds_instance_class" {
  default = "db.t3.micro"
}

variable "rds_username" {
  default = "admin"
}

variable "rds_password" {
  default = "password"
}
