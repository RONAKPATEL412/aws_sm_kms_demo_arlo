output "secret" {
  value = module.secret.secret
}

output "secret_version" {
  sensitive = true
  value     = module.secret.secret_version
}
