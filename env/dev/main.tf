provider "aws" {
  region  = var.region
  profile = "golden-dev"
  assume_role {
    role_arn = var.role_which_applies_terraform
  }
}

module "aws_kms_key" {
  source = "./../../modules/aws_key_management_service/"

  aws_account_id         = data.aws_caller_identity.current.account_id
  aws_region             = var.region
  name                   = "test-aws-kms-11234"
  value                  = "sdsfg33324"
  aws_secretsmanager_arn = module.aws_sm.arn
  key_principals         = ["arn:aws:iam::851740348668:role/hmsstreaming_role_irobot_goldendev", "arn:aws:iam::241639520805:role/EC2toEKS"]
}

module "aws_sm" {
  source = "./../../modules/aws_secrets_manager/"

  name              = "test-aws-sm-11234"
  value             = "rokkkk334311234"
  kms_key_id        = module.aws_kms_key.key_id
  aws_account_id    = data.aws_caller_identity.current.account_id
  secret_principals = var.sm_principals
  applying_user     = var.role_which_applies_terraform
  tags = {
    whodunnit = "dhruv"
    why       = "testing"
  }
}
