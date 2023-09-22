variable "role_name" {
  description = "Name of the IAM role"
}

variable "assumable_accounts" {
  description = "List of AWS account IDs that can assume this role"
  type        = list(string)
}

variable "name_tag" {
  description = "Name tag for the IAM role"
}

variable "additional_tags" {
  description = "Additional tags to be applied to the IAM role"
  type        = map(string)
  default     = {}
}

variable "policy_name" {
  description = "Name of the IAM policy"
}
