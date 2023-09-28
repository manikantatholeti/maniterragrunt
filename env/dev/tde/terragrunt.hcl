################################################################################
# Source Path
################################################################################

terraform {
  source = "git@github.com:manikantatholeti/maniterragrunt.git//terraform-templates/jenkins/"
  #source = "../../../terraform-templates/jenkins"
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
remote_state {
  backend = "s3"
  config = {
    bucket         = "vtsl-automation-mgmt"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "vtsl-automation-table-mgmt"
  }
}
}

