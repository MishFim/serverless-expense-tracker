data "archive_file" "zip" {
  type        = "zip"
  source_file = var.source_file
  output_path = var.lambda_zip_path
}

resource "aws_lambda_function" "handler" {
  filename         = data.archive_file.zip.output_path
  function_name    = var.function_name
  role             = var.role_arn
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.12"
  source_code_hash = data.archive_file.zip.output_base64sha256

  environment {
    variables = {
      TABLE_NAME = var.table_name
    }
  }
}
