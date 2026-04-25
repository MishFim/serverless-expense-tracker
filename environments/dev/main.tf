module "expense_tracker" {
  source = "../../terraform"

  aws_region   = var.aws_region
  project_name = var.project_name
}