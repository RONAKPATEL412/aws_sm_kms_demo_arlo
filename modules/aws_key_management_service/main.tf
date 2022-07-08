
resource "aws_kms_key" "aws_sm_dns_mapper_kms_key" {
  description         = var.aws_sm_dns_mapper_kms_key_description
  customer_master_key_spec = var.key_spec
  is_enabled               = var.enabled
  enable_key_rotation      = var.rotation_enabled  

  tags = {
    Name = var.aws_sm_dns_mapper_kms_key_tags_name
  }

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Id": "key-consolepolicy-2",
  "Statement": [
    {
      "Sid": "Enable IAM policies",
      "Effect": "Allow",
      "Principal": {"AWS": "arn:aws:iam::111122223333:root"},
      "Action": "kms:*",
      "Resource": "*"
    },
    {
      "Sid": "Allow access for Key Administrators",
      "Effect": "Allow",
      "Principal": {"AWS": [
        "arn:aws:iam::111122223333:user/KMSAdminUser",
        "arn:aws:iam::111122223333:role/KMSAdminRole"
      ]},
      "Action": [
        "kms:Create*",
        "kms:Describe*",
        "kms:Enable*",
        "kms:List*",
        "kms:Put*",
        "kms:Update*",
        "kms:Revoke*",
        "kms:Disable*",
        "kms:Get*",
        "kms:Delete*",
        "kms:TagResource",
        "kms:UntagResource",
        "kms:ScheduleKeyDeletion",
        "kms:CancelKeyDeletion"
      ],
      "Resource": "*"
    },
    {
      "Sid": "Allow use of the key",
      "Effect": "Allow",
      "Principal": {"AWS": [
        "arn:aws:iam::111122223333:user/ExampleUser",
        "arn:aws:iam::111122223333:role/ExampleRole",
        "arn:aws:iam::444455556666:root"
      ]},
      "Action": [
        "kms:Encrypt",
        "kms:Decrypt",
        "kms:ReEncrypt*",
        "kms:GenerateDataKey*",
        "kms:DescribeKey"
      ],
      "Resource": "*"
    },
    {
      "Sid": "Allow attachment of persistent resources",
      "Effect": "Allow",
      "Principal": {"AWS": [
        "arn:aws:iam::111122223333:user/ExampleUser",
        "arn:aws:iam::111122223333:role/ExampleRole",
        "arn:aws:iam::444455556666:root"
      ]},
      "Action": [
        "kms:CreateGrant",
        "kms:ListGrants",
        "kms:RevokeGrant"
      ],
      "Resource": "*",
      "Condition": {"Bool": {"kms:GrantIsForAWSResource": "true"}}
    }
  ]
}
EOF
}

resource "aws_kms_alias" "aws_sm_dns_mapper_kms_key_alish" {
  target_key_id = aws_kms_key.aws_sm_dns_mapper_kms_key.key_id
  name          = "alias/${var.kms_alias}"
}
