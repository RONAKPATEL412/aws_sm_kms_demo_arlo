resource "aws_kms_key" "aws_sm_dns_mapper_kms_key1" {
  description         = var.aws_sm_dns_mapper_kms_key_description
  customer_master_key_spec = var.key_spec
  is_enabled               = var.enabled
  enable_key_rotation      = var.rotation_enabled  

  tags = {
    Name = var.aws_sm_dns_mapper_kms_key_tags_name
  }

 policy = data.aws_iam_policy_document.key_policy.json
}

resource "aws_kms_alias" "aws_sm_dns_mapper_kms_key_alish" {
  target_key_id = aws_kms_key.aws_sm_dns_mapper_kms_key1.key_id
  name          = "alias/${var.kms_alias}"
}

data "aws_iam_policy_document" "key_policy" {
  statement {
    sid = "root user"
    actions   = ["kms:*"]
    resources = ["*"]
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.aws_account_id}:root"]
    }
  }
  dynamic "statement" {
    for_each = var.key_principals
    content {
      sid = "AllowAccess${statement.key}"
      actions   = ["kms:*"]
      resources = ["*"]

      principals {
        type        = "AWS"
        identifiers = [statement.value]
      }
    }
  }
}
