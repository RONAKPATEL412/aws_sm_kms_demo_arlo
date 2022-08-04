# AWS SM Outputs
output "arn" {
  description = "AWS SecretManager Secret ARN"
  value       = module.aws_sm.arn
}

output "id" {
  description = "AWS SecretManager Secret ARN"
  value       = module.aws_sm.id
}

output "secret" {
  description = "AWS SecretManager Secret resource"
  value       = module.aws_sm.secret
}

output "secret_version" {
  description = "AWS SecretManager Secret Version resource"
  value       = module.aws_sm.secret
}

# AWS KMS Outputs
output "key_id" {
  value = module.aws_kms_key.key_id
}
