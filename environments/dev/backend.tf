terraform {
  backend "s3" {
    bucket         = "tfstate-expense-tracker-unique-2026"
    key            = "environments/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "expense-tracker-locks"
    encrypt        = true
  }
}