terraform {
  required_version = ">= 1.2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.50.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "my_s3_bucket_jz" {
  bucket_prefix = "my-tf-test-bucket"
  force_destroy = true
  tags = {
    Name = "My bucket"
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-up-and-running-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

# terraform {
#   backend "s3" {
#     # replace with your bucket name, region and dynamob table name
#     bucket         = "my-tf-test-bucket20240521104706254600000001"
#     key            = "global/s3/terraform-bucket.tfstate"
#     region         = "us-west-1"
#     dynamodb_table = "terraform-up-and-running-locks"
#   }
# }