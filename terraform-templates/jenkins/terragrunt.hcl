include "root" {
  path = find_in_parent_folders()
  expose = true
}
remote_state {
  backend = "s3"
  config = {
    bucket         = "vtsl-automation-mgmt"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = false
    dynamodb_table = "vtsl-automation-table-mgmt"
  }
}
