output "key_id" {
  value = aws_kms_key.aws_sm_dns_mapper_kms_key.key_id
}

output "key_arn" {
  value = aws_kms_key.aws_sm_dns_mapper_kms_key.arn
}