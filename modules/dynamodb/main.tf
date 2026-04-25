resource "aws_dynamodb_table" "expenses" {
  name         = var.table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "expense_id"

  attribute {
    name = "expense_id"
    type = "S"
  }
}