# GCP Terraform Project

A comprehensive Terraform project for Google Cloud Platform with 12 reusable modules following best practices.

## 🏗️ Architecture

This project provides a modular approach to GCP infrastructure management with the following components:

### Modules (12 total)

1. **VPC** - Virtual Private Cloud with private IP allocation
2. **Subnets** - Regional subnets with logging and private Google access
3. **Firewall** - Security rules with default deny-all and allow-egress policies
4. **IAM** - Project-level IAM bindings
5. **Service Accounts** - Service accounts with basic roles
6. **Storage** - Cloud Storage buckets with lifecycle policies
7. **Compute** - VM instances with Ubuntu and nginx
8. **CloudSQL** - Managed database instances with backup and maintenance
9. **GKE** - Google Kubernetes Engine clusters with security features
10. **GKE Node Pool** - Node pools with autoscaling and management
11. **DNS** - Managed DNS zones with DNSSEC
12. **Load Balancer** - Global HTTP load balancers with CDN

## 📁 Project Structure

```
gcp-terraform-project/
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── subnets/
│   ├── firewall/
│   ├── iam/
│   ├── service_accounts/
│   ├── storage/
│   ├── compute/
│   ├── cloudsql/
│   ├── gke/
│   ├── gke_nodepool/
│   ├── dns/
│   └── loadbalancer/
├── main.tf
├── variables.tf
├── outputs.tf
├── values.yaml
├── terraform.tfvars (auto-generated)
├── generate_tfvars.py
└── README.md
```

## 🚀 Quick Start

### Prerequisites

- Terraform >= 1.0
- Google Cloud SDK
- Python 3.x
- PyYAML (`pip install PyYAML`)

### Setup

1. **Clone and navigate to the project:**
   ```bash
   cd gcp-terraform-project
   ```

2. **Configure your GCP project:**
   ```bash
   # Set your project ID
   export GOOGLE_PROJECT_ID="your-project-id"
   
   # Authenticate with GCP
   gcloud auth application-default login
   ```

3. **Update values.yaml:**
   ```yaml
   project_id: "your-actual-project-id"
   region: "us-central1"
   # ... other configurations
   ```

4. **Generate terraform.tfvars:**
   ```bash
   python3 generate_tfvars.py
   ```

5. **Initialize and plan:**
   ```bash
   terraform init
   terraform plan
   ```

6. **Apply the configuration:**
   ```bash
   terraform apply
   ```

## ⚙️ Configuration

### values.yaml

The `values.yaml` file contains all configuration parameters:

```yaml
project_id: "my-gcp-project"
region: "us-central1"
vpc_name: "main-vpc"

subnets:
  - name: "subnet-1"
    cidr: "10.0.1.0/24"

firewall_rules:
  - name: "allow-ssh"
    ports: ["22"]

# ... more configurations
```

### generate_tfvars.py

The Python script converts YAML to Terraform variable format:

```bash
python3 generate_tfvars.py
```

Features:
- Handles strings, numbers, booleans, lists, and objects
- Generates proper Terraform syntax
- Validates YAML structure
- Auto-generates terraform.tfvars

## 🔧 Module Details

### VPC Module
- Creates VPC with custom subnets
- Enables private IP allocation for Cloud SQL
- Configures service networking

### Subnets Module
- Regional subnets with logging
- Private Google access enabled
- Flow logs configuration

### Firewall Module
- Custom firewall rules
- Default deny-all ingress
- Allow-all egress

### IAM Module
- Project-level role bindings
- Flexible member configuration

### Service Accounts Module
- Service accounts with descriptions
- Basic role assignments
- Email output for references

### Storage Module
- Cloud Storage buckets
- Versioning enabled
- Lifecycle policies
- Private by default

### Compute Module
- Ubuntu-based VMs
- Nginx pre-installed
- SSH key configuration
- Network tags

### CloudSQL Module
- PostgreSQL instances
- Private IP configuration
- Automated backups
- Maintenance windows

### GKE Module
- Private clusters
- Workload identity
- Network policies
- Monitoring and logging

### GKE Node Pool Module
- Autoscaling node pools
- Shielded nodes
- Confidential computing
- Management policies

### DNS Module
- Managed DNS zones
- DNSSEC enabled
- A and CNAME records

### Load Balancer Module
- Global HTTP load balancers
- Health checks
- CDN integration
- Backend services

## 🔒 Security Features

- **Private clusters** with restricted access
- **Shielded nodes** with secure boot
- **DNSSEC** for DNS zones
- **Private IP** for databases
- **Firewall rules** with least privilege
- **Service accounts** with minimal permissions
- **Workload identity** for GKE

## 📊 Outputs

The project provides comprehensive outputs:

```hcl
output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "gke_cluster_endpoints" {
  description = "Endpoints of the GKE clusters"
  value       = module.gke.gke_cluster_endpoints
}

# ... more outputs
```

## 🛠️ Backend Configuration

The project uses GCS backend for state management:

```hcl
backend "gcs" {
  bucket = "my-terraform-state-bucket"
  prefix = "terraform/state"
}
```

## 🧪 Testing

Validate the configuration:

```bash
# Check syntax
terraform validate

# Plan without applying
terraform plan

# Check formatting
terraform fmt -check
```

## 📝 Best Practices

1. **Modular Design** - Reusable modules with clear interfaces
2. **State Management** - Remote state with GCS backend
3. **Security** - Private resources and least privilege access
4. **Monitoring** - Comprehensive logging and monitoring
5. **Documentation** - Clear variable descriptions and outputs
6. **Version Control** - Provider version constraints
7. **Cost Optimization** - Appropriate machine types and regions

## 🔄 Workflow

1. Update `values.yaml` with your requirements
2. Run `python3 generate_tfvars.py` to generate variables
3. Run `terraform plan` to review changes
4. Run `terraform apply` to create resources
5. Use outputs for integration with other systems

## 📚 Additional Resources

- [Terraform GCP Provider Documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs)
- [GCP Best Practices](https://cloud.google.com/docs/terraform/best-practices)
- [Terraform Modules](https://www.terraform.io/docs/modules/index.html)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.
