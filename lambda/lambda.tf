data "archive_file" "lambda" {
  type        = "zip"
  source_file = "${var.lambda_source_file_path}${var.lambda_file_name}${var.lambda_file_extention}"
  output_path = "lambda.zip"
}

resource "aws_lambda_function" "lambda" {
  filename      = data.archive_file.lambda.output_path
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_role.arn
  handler       = "${var.lambda_file_name}.${var.lambda_function_name}"

  source_code_hash = data.archive_file.lambda.output_base64sha256
  runtime          = var.lambda_run_time
}