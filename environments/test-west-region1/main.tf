terraform {
  required_version = ">= 1.2.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.50.0"
    }
  }

  backend "s3" {
    # replace with your bucket name, region and dynamob table name
    bucket         = "my-tf-test-bucket20240524075926801900000001"
    key            = "global/s3/terraform-west1.tfstate"
    region         = "us-west-1"
    dynamodb_table = "terraform-up-and-running-locks"
  }
}

provider "aws" {
  region = var.aws_region
}

module "python_lambda" {
  source                  = "../../lambda"
  lambda_source_file_path = "../../"
  lambda_file_name        = "app"
}