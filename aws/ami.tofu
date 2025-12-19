data "aws_ami" "runner_os" {
  most_recent = true
  owners      = [var.ami_owner_id] # Official Red Hat AMIs

  filter {
    name   = "name"
    values = [var.ami_name_lookup]
  }

  filter {
    name   = "architecture"
    values = [var.ami_architecture]
  }

  filter {
    name   = "root-device-type"
    values = [var.ami_root_device_type]
  }

  filter {
    name   = "virtualization-type"
    values = [var.ami_virtualization_type]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}
