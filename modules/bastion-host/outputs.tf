output "private_key" {
  value     = replace(tls_private_key.this.private_key_pem, "\n", "\\n")
  sensitive = true
}

output "public_key" {
  value = tls_private_key.this.public_key_openssh
}

output "ami" {
  value     = data.aws_ssm_parameter.latest_ami
  sensitive = true
}
