resource "aws_security_group" "runner" {
  name_prefix = "gitlab-runner-"
  description = "Security group for GitLab runners"
  vpc_id      = data.aws_subnet.runner_subnet.vpc_id

  tags = merge(
    var.resources_tags,
  )
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.runner.id
  description       = "Allow SSH access"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"

  tags = {
    "Name" = "ssh-access"
  }
}

resource "aws_vpc_security_group_ingress_rule" "runner_http" {
  security_group_id = aws_security_group.runner.id
  description       = "Allow GitLab runner HTTP interface"
  from_port         = 8093
  to_port           = 8093
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"

  tags = {
    "Name" = "runner-http"
  }
}

resource "aws_vpc_security_group_egress_rule" "all_outbound" {
  security_group_id = aws_security_group.runner.id
  description       = "Allow all outbound traffic"
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"

  tags = {
    "Name" = "all-outbound"
  }
}
