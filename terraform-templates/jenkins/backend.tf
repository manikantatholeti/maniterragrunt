terraform {
  backend "s3" {
    bucket         = "test-bucket-terragrunt"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "vtsl-automation-table-mgmt"
  }
}