module "dynamodb" {
  source     = "../modules/dynamodb"
  table_name = "Expenses"
}

module "iam" {
  source       = "../modules/iam"
  project_name = var.project_name
}

module "lambda" {
  source          = "../modules/lambda"
  function_name   = "ExpenseHandler"
  role_arn        = module.iam.lambda_role_arn
  table_name      = module.dynamodb.table_name
  lambda_zip_path = "${path.module}/lambda_function.zip"
  source_file     = "${path.module}/../lambda/lambda_function.py"
}

module "apigateway" {
  source              = "../modules/apigateway"
  lambda_invoke_arn   = module.lambda.invoke_arn
  lambda_function_name = module.lambda.function_name
}