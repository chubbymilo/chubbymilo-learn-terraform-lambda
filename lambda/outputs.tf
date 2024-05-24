output "function_url" {
  value       = aws_lambda_function_url.test_url.function_url
  description = "The URL of Python lambda"
}