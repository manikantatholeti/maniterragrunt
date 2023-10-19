generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  backend "s3" {
    bucket         = "fiserv-terraform-state-bucket-new" 
    dynamodb_table = "fiserv-terraform-state-lock-new"
    key            = "test-iamrole/terraform.tfstate"
    region         = "us-east-1"
    profile        = "default"
    encrypt        = false
  }
}
EOF
}
################################################################################
# Source Path
################################################################################

terraform {
  #source = "git@github.com:manikantatholeti/maniterragrunt.git//terraform-templates/jenkins/"
  source = "../../..//terraform-templates/jenkins"
}
################################################################################
# Dependancy Path (If Any)
################################################################################



################################################################################
# Inputs
################################################################################
inputs = {
  iam_role_name = "mani-iamrole"
  iam_role_profile = "mani-iamprofile"
  iam_role_policy = "mani-iampolicy"
}

