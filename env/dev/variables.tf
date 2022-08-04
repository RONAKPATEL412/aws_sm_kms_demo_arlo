variable "description" {
  description = "AWS Secrets Managers and KMS key"
  default     = "terraform-managed secret"
  type        = string
}

variable "region" {
  description = "AWS Region"
  default     = "us-west-2"
}
variable "sm_principals" {
  description = "list of principals to access secret"
  type        = list(string)
  default     = ["arn:aws:iam::851740348668:role/hmsstreaming_role_irobot_goldendev", "arn:aws:iam::851740348668:role/EC2toEKS"]
}

variable "kms_principals" {
  description = "list of kms principals to use kms key"
  type        = list(string)
  default     = ["arn:aws:iam::851740348668:role/hmsstreaming_role_irobot_goldendev", "arn:aws:iam::851740348668:role/EC2toEKS"]
}

variable "role_which_applies_terraform" {
  description = "ARN of IAM role which will be assumed to apply this code"
  type        = string
  default     = "arn:aws:iam::851740348668:role/EC2toEKS"
}

