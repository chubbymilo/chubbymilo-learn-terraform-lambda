run "create_lambda" {
  command = apply

  assert {
    condition     = strcontains(module.python_lambda.function_url, "us-west-1")
    error_message = "incorrect region"
  }
}

run "lambda_is_running" {
  command = plan

  module {
    source = "./tests/check"
  }

  variables {
    endpoint = run.create_lambda.lambda_url
  }
  assert {
    condition     = data.http.lambda.status_code == 200
    error_message = "Website responded with HTTP status ${data.http.lambda.status_code}"
  }
}