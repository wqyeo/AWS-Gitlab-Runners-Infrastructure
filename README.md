# AWS-Gitlab-Runners-Infrastructure
IaC to create CICD Runners for Gitlab, with existing VPC and subnets

## Ansible

> Uses [`amazon.aws.aws_ec2`](https://docs.ansible.com/projects/ansible/latest/collections/amazon/aws/aws_ec2_inventory.html) Plugin  to connect to AWS and fetch nodes `ansible-galaxy collection install amazon.aws`.
> 
> You may need certain python packages installed in your local controller node as well. Check the [`aws_ec2_inventory`](https://docs.ansible.com/projects/ansible/latest/collections/amazon/aws/aws_ec2_inventory.html#requirements) documentation.