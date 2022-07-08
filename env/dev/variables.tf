variable "description" {
  description = "AWS Secrets Managers and KMS key"
  default     = "terraform-managed secret"
  type        = string
}

variable "region" {
  description = "AWS Region"
  default     = "us-west-2"
}