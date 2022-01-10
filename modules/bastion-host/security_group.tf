resource "aws_security_group" "this" {
  description = "Enable SSH access to the bastion host"
  name        = "${var.name}-sg"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "ingress" {
  description       = "Incoming traffic to bastion"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "TCP"
  cidr_blocks       = var.allowed_cidrs
  security_group_id = aws_security_group.this.id
}

resource "aws_security_group_rule" "egress" {
  description       = "Outgoing traffic from bastion"
  type              = "egress"
  from_port         = "0"
  to_port           = "65535"
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this.id
}

