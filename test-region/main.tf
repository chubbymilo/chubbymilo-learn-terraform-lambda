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

module "python_lambda" {
  source                  = "../lambda"
  aws_region              = "us-west-1"
  lambda_source_file_path = "../"
  lambda_file_name = "app"
}