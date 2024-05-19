variable "aws_region" {
  default     = "us-west-2"
  type        = string
  description = "Region to use for AWS services"
}

variable "lambda_file_name" {
  type        = string
  description = "Name of the lambda function file"
}

variable "lambda_file_extention" {
  default     = ".py"
  type        = string
  description = "The extention of the lambda file"
  validation {
    condition     = var.lambda_file_extention == ".py"
    error_message = "the file has to be Python file"
  }
}

variable "lambda_source_file_path" {
  type        = string
  description = "The path to the lambda source file without the file name"
}

variable "lambda_function_name" {
  default     = "lambda_test"
  type        = string
  description = "The name of the lambda function from the Python file"
}

variable "lambda_run_time" {
  default     = "python3.11"
  type        = string
  description = "The run time of the lambda function"
  validation {
    condition     = can(regex("python3.1\\d", var.lambda_run_time))
    error_message = "Please ensure the run time has to be python3.10 or above"
  }
}

variable "lambda_role_name" {
  default     = "first-lambda-role"
  type        = string
  description = "The name of the ami role"
}

variable "lambda_permission_name" {
  default     = "lambda-permissions"
  type        = string
  description = "The name of the ami role policy for accessing the lambda"
}