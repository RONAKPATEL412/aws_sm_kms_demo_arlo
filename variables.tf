
variable "description" {
  default = "terraform-managed secret"
  type    = string
}

variable "kms_key_id" {
  default     = null
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
  default     = {}
  description = "User-Defined tags"
  type        = map(string)
}

variable "value" {
  description = "Secret value to store"
  type        = string
}

variable "region" {
  default = "us-east-1"
}

variable "user_arn" {
  default ="arn:aws:iam::047109936880:user/khong-aol"
}

variable key_spec {
  default = "SYMMETRIC_DEFAULT"
}

variable rotation_enabled {
  default = true
}

variable enabled {
  default = true
}

variable kms_alias {
  default = "default_kms_alish"
}