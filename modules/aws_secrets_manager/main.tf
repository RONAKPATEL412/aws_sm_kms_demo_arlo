resource "aws_secretsmanager_secret" "secret" {
  kms_key_id = var.kms_key_id
  name       ="alias/${var.kms_alias}"
 // policy     = var.policy
  tags       = var.tags
}

resource "aws_secretsmanager_secret_version" "secret" {
  secret_id     = aws_secretsmanager_secret.secret.id
  secret_string = var.value
}


