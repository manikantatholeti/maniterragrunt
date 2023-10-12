module "jenkins_role" {
  source = "../../terraform-modules/iam_role"
  #source = "git@github.com:manikantatholeti/maniterragrunt.git//terraform-modules/iam_role"

  trusted_role_services = [
    "ec2.amazonaws.com"
  ]

  create_role = true

  role_name               = "role-jenkins_service"
  role_requires_mfa       = false
  create_instance_profile = true
  iam_role_name           = var.iam_role_name
  iam_role_profile        = var.iam_role_profile
  iam_role_policy         = var.iam_role_policy
}
