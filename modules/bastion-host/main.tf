data "aws_ssm_parameter" "latest_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

resource "aws_instance" "this" {
  ami                         = data.aws_ssm_parameter.latest_ami.value
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.this.id
  vpc_security_group_ids      = [aws_security_group.this.id]
  associate_public_ip_address = true
  subnet_id                   = var.subnet_id

  tags = {
    Name = var.name
  }

  lifecycle {
    ignore_changes = [ami]
  }
}
