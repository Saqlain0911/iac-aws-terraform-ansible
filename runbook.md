## 🚀 Quick Start Guide

This guide walks you through provisioning and configuring the infrastructure end to end using Terraform and Ansible.

---

### 1️⃣ Prerequisites

Ensure the following tools and configurations are in place:

- AWS CLI installed and configured with valid credentials
- Terraform and Ansible installed locally
- SSH key pair named `id_ed25519_project` present in the project root
- An AWS account with permissions to create networking and compute resources

### 2️⃣ Provision Infrastructure (Terraform)

```bash
cd terraform
terraform init
terraform apply -auto-approve
```

Terraform will:

- Provision AWS networking and compute infrastructure
- Create a VPC, public subnet, security groups, and EC2 instance
- Store the Terraform state remotely in S3
- Use DynamoDB for state locking and concurrency control
- Output the EC2 public IP and generate a dynamic Ansible inventory file

### 3️⃣ Configure the Server (Ansible)

```bash
cd ../ansible
ansible-playbook -i inventory/hosts.ini playbooks/site.yml
```

Ansible will:

- Apply system baseline configuration (APT updates and essential packages)
- Install and configure Docker
- Install and start Nginx
- Ensure services are enabled and idempotent

### 4️⃣ Verify Deployment

Open a browser and navigate to the public IP address output by Terraform.

✅ You should see the Nginx welcome page, confirming that infrastructure provisioning and configuration completed successfully.

### 5️⃣ Cleanup (Cost Control)

```bash
cd ../terraform
terraform destroy -auto-approve
```

This will:

- Safely destroy all AWS resources created by Terraform
- Remove networking, compute, and related dependencies
- Ensure no residual cloud costs remain
