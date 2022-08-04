
variable "description" {
  description = "AWS Secrets Managers with KMS"
  default = "terraform-managed secret4"
  type    = string
}

variable "kms_key_id" {
  description = "Optional. The KMS Key ID to encrypt the secret. KMS key arn or alias can be used."
}

variable "policy" {
  default     = null
  description = "Optional. The resource policy which controls access to the secret."
}

variable "name" {
  description = "Name of secret to store"
  type        = string
}

variable "tags" {
  default     = {
     Name = "my_kms_key_14"
  }
  description = "User-Defined tags"
  type        = map(string)
}

variable "value" {
  description = "Secret value to store"
  type        = string
}


variable kms_alias {
  description = "Optional. AWS Secrets manager secrets name"
  default = "default_kms_alish_demo_11245678"
}

variable "aws_account_id" {
  description = "AWS account ID Value"
}

variable "secret_principals" {
  description = "list of AWS principals to access created secret"
  type = list(string)
}

variable "applying_user" {
  description = "terraform user that applies code"
}
