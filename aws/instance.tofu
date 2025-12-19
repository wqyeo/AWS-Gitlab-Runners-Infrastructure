resource "aws_instance" "cicd-runner_os" {
  count              = var.instance_count
  ami                = data.aws_ami.runner_os.id
  instance_type      = var.instance_type
  subnet_id          = data.aws_subnet.runner_subnet.id
  key_name           = aws_key_pair.cicd_runner.key_name
  security_groups    = [aws_security_group.runner.id]

  root_block_device {
    volume_type = "standard"
    volume_size = 16
    delete_on_termination = true
  }

  tags = merge(
    var.resources_tags,
    {
      "Name" = "${var.instance_name}-${count.index + 1}"
    }
  )
}