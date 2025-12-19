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

variable "resources_tags" {
  description = "A map of tags to assign to AWS resources."
  type        = map(string)
  default = {
    "role" = "cicd-runners"
    "env"  = "dev"
  }
}

#region AMI Filter

variable "ami_name_lookup" {
  description = "The name pattern to look up the AMI for the GitLab runners."
  type        = string
}

variable "ami_owner_id" {
  description = "The owner ID of the AMI for the GitLab runners."
  type        = string
}

variable "ami_architecture" {
  description = "The architecture of the AMI."
  type        = string
  default     = "x86_64"
}

variable "ami_root_device_type" {
  description = "The root device type of the AMI."
  type        = string
  default     = "ebs"
}

variable "ami_virtualization_type" {
  description = "The virtualization type of the AMI."
  type        = string
  default     = "hvm"
}

#endregion

#region Instance Configuration

variable "instance_type" {
  description = "The instance type for the GitLab runners."
  type        = string
  default     = "t3.medium"
}

variable "instance_count" {
  description = "The number of GitLab runner instances to create."
  type        = number
  default     = 1
}

variable "instance_name" {
  description = "The base name for the GitLab runner instances."
  type        = string
}

#endregion
