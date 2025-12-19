resource "aws_key_pair" "cicd_runner" {
  key_name   = var.key_pair_name
  public_key = file(var.ssh_key_file_path)
}