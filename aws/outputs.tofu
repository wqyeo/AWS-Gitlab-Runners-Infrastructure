output "instance_public_ipv4" {
  description = "Public IPv4 addresses of the created CI/CD runner instances"
  value       = aws_instance.cicd-runner_os[*].public_ip
}
