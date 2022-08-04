resource "aws_secretsmanager_secret" "secret_re1" {
  kms_key_id = var.kms_key_id
  name       = "alias/${var.kms_alias}"
  tags       = var.tags
}

resource "aws_secretsmanager_secret_policy" "example1" {
  secret_arn = aws_secretsmanager_secret.secret_re1.arn
  policy = data.aws_iam_policy_document.secretsmanager_policy.json
}

resource "aws_secretsmanager_secret_version" "secret1" {
  secret_id     = aws_secretsmanager_secret.secret_re1.id
  secret_string = var.value
}

data "aws_iam_policy_document" "secretsmanager_policy" {
  statement {
    actions   = ["secretsmanager:GetSecretValue"]
    resources = ["*"]
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.aws_account_id}:root", var.applying_user]
    }
  }
  dynamic "statement" {
    for_each = var.secret_principals

    content {
      actions   = ["secretsmanager:GetSecretValue",
                  "secretsmanager:DescribeSecret",
                  "secretsmanager:ListSecretVersionIds",
                  "secretsmanager:PutSecretValue",
                  "secretsmanager:UpdateSecret",
                  "secretsmanager:TagResource",
                  "secretsmanager:UntagResource",
                  "secretsmanager:GetResourcePolicy"]

      resources = ["*"]

      principals {
        type        = "AWS"
        identifiers = [statement.value]
      }
    }
  }
}
