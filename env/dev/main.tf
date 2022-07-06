provider "aws" {
  region = "us-east-1"
}

module "aws_kms_key" {
  source = "./../../modules/aws_key_management_service/"
  name   = "test-aws-kms"
  value  = "sdsfg3"
}

module "aws_sm" {
  source = "./../../modules/aws_secrets_manager/"

  name       = "test-aws-sm"
  value      = "rokkkk3343"
  kms_key_id = module.aws_kms_key.key_id
  // policy     = data.template_file.example.rendered            # Optional
  tags = {
    whodunnit = "dhruv"
    why       = "testing"
  }
}
