variable "name" {
   description = "Name of secret to store"
   type        = string
}

variable "aws_region" {
   description = "AWS region value"
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

variable "user_arn" {
  description = "AWS ARN"
  default ="arn:aws:iam::663347784972:user/ronak"
}

variable key_spec {
  description = "AWS Secrets Manager KMS key Key Spec value"
  default = "SYMMETRIC_DEFAULT"
}
variable enabled {
  description = "default true"
  default = true
}
variable rotation_enabled {
  description = "Key rotation default true"
  default = true
}
variable "kms_alias" {
    description = "AWS secrets manager dns mapper kms key alish name alish"
    default = "aws_sm_dns_mapper_kms_key_alishs_kms_alish_agian"
}
variable "aws_sm_dns_mapper_kms_key" {
   description = "AWS secrets manager DNS Mapper KMS Key "
    default = "default_kms_alish_agian"
}

variable "aws_sm_dns_mapper_kms_key_description" {
   description = "AWS secrets manager DNS Mapper KMS Key desc"
  default  = "My KMS Keys for Data Encryption"
}

variable "aws_sm_dns_mapper_kms_key_tags_name" {
  description = "AWS secrets manager DNS Mapper KMS Key tages name"
  default   = "my_kms_key_14"
}

variable "aws_secretsmanager_arn" {
  description = "AWS secrets manager ARN Value"
}

variable "aws_account_id" {
  description = "AWS account ID Value"
}

variable "key_principals" {
  description = "list of AWS principals to access created kms key"
  type = list(string)
}
