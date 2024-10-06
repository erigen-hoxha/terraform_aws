#This declaration takes precedence over the defalt value in variables.tf file, but if in advance the region changes, the declaration made in terraform.tfvars file overrides the one of variables.tf file.
aws_region = "us-east-1"
