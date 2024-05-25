terraform {
  required_version = ">= 1.2.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.50.0"
    }
  }
  # To store the S3's file in S3 if required
  #   backend "s3" {
  #   # replace with your bucket name, region and dynamob table name
  #   bucket         = "my-tf-test-bucket20240521104706254600000001"
  #   key            = "global/s3/terraform-bucket.tfstate"
  #   region         = "us-west-1"
  #   dynamodb_table = "terraform-up-and-running-locks"
  # }
}

provider "aws" {
  region = var.aws_region
}

# TODO: Should turn the creation of S3 into a module
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

resource "aws_kms_key" "my_first_key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket_server_side_encryption_configuration" "my_bucket_encryption" {
  bucket = aws_s3_bucket.my_s3_bucket_jz.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.my_first_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "my_bucket_public_access_block" {
  bucket = aws_s3_bucket.my_s3_bucket_jz.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}