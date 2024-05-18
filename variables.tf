variable "aws_region" {
  default = "us-west-2"
}

variable "lambda_file_name" {
  default = "app"
}

variable "lambda_file_extention" {
  default = ".py"
}

variable "lambda_function_name" {
  default = "lambda_test"
}

variable "lambda_run_time" {
  default = "python3.11"
}

variable "lambda_role_name" {
  default = "first-lambda-role"
}

variable "lambda_permission_name" {
  default = "lambda-permissions"
}

variable "file_type" {
  default = "zip"
}

variable "output_path" {
  default = "lambda.zip"
}