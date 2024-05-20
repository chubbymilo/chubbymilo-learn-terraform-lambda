terraform {
  required_version = ">= 1.2.0"
}

terraform {
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

module "python_lambda" {
  source                  = "../lambda"
  aws_region              = var.aws_region
  lambda_source_file_path = "../"
  lambda_file_name        = "app"
}

terraform {
  backend "s3" {
    # replace with your bucket name, region and dynamob table name
    bucket         = "my-tf-test-bucket"
    key            = "global/s3/terraform.tfstate"
    region         = "us-west-1"
    dynamodb_table = "terraform-up-and-running-locks"
  }
}