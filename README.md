# AWS-Gitlab-Runners-Infrastructure

Infrastructure as Code to provision and configure GitLab CI/CD Runners on AWS, using existing VPC and subnets.

## Technology Stack

- **[OpenTofu](https://opentofu.org/)** - Infrastructure provisioning
- **Ansible** - Configuration management and tool installation

## Prerequisites

### OpenTofu
Install [OpenTofu](https://opentofu.org/) or have Terraform available.

### Ansible
```bash
# Install Ansible
pip install ansible

# Install required AWS collection
ansible-galaxy collection install amazon.aws
```

## Configuration

### 1. OpenTofu (AWS Resources)

Navigate to the `aws/` directory and configure your AWS resources:

```bash
cd aws/
cp terraform.sample.tfvars terraform.tfvars
# Edit terraform.tfvars with your settings
tofu init
tofu apply
```

### 2. Ansible (Runner Configuration)

Navigate to the `ansible/RHEL9/` directory:

```bash
cd ansible/RHEL9/
cp sample.vars.yaml vars.yaml
# Edit vars.yaml with your GitLab runner configuration
```

Update `inventory.aws_ec2.yml` if needed for AWS connection settings, then run the playbook:

```bash
ansible-playbook playbook.yml
```

> **Note:** The playbook uses the [`amazon.aws.aws_ec2`](https://docs.ansible.com/projects/ansible/latest/collections/amazon/aws/aws_ec2_inventory.html) plugin to dynamically fetch EC2 instances. Ensure your AWS credentials are configured.