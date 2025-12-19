variable "access_key" {
  description = "The AWS access key."
  type        = string
}

variable "secret_key" {
  description = "The AWS secret key."
  type        = string
}

variable "region" {
  description = "The AWS region."
  type        = string
  default     = "ap-southeast-1"
}

variable "runner_subnet_id" {
  description = "The ID of the subnet for the GitLab runners."
  type        = string
}

variable "key_pair_name" {
  description = "The name of the AWS key pair to use for the GitLab runners."
  type        = string
  default     = "CICD-Runner-Key"
}

variable "ssh_key_file_path" {
  description = "The file path to the SSH public key."
  type        = string
}