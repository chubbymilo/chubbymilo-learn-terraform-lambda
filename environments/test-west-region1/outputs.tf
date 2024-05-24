output "lambda_url" {
  value       = module.python_lambda.function_url
  description = "The public URL of the lambd function"
}