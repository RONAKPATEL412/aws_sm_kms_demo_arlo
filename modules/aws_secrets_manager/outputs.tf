
output "arn" {
  description = "AWS SecretManager Secret ARN"
  value       = aws_secretsmanager_secret.secret_re1.arn
}

output "id" {
  description = "AWS SecretManager Secret ARN"
  value       = aws_secretsmanager_secret.secret_re1.id
}

output "secret" {
  description = "AWS SecretManager Secret resource"
  value       = aws_secretsmanager_secret.secret_re1.kms_key_id
}
