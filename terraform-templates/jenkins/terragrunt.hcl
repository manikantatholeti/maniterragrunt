include "root" {
  path = find_in_parent_folders()
  expose = true
}
terraform {
  backend "s3" {
    bucket         = "test-bucket-terragrunt"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "vtsl-automation-table-mgmt"
  }
}