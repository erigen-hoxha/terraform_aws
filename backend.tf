#This file configures the Terraform backend to store the state in an S3 bucket.
terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket"    #the name of the S3 bucket where Terraform will store its state
    key    = "global/s3/terraform.tfstate"  #the specific file path within the S3 bucket to store the state file
    region = "us-east-1"                    #the region where the S3 bucket is located
    dynamodb_table = "terraform-state-lock-table"   # the DynamoDB table for state locking
  }
}
