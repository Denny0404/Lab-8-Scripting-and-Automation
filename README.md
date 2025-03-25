# PROG8330 - Lab 8: Terraform AWS Deployment

## Project Overview
This project demonstrates the use of **Terraform** to provision and manage a cloud-based infrastructure on AWS. The setup includes:

- **Amazon VPC**: A virtual network to host all resources.
- **Subnets**: Two public subnets for high availability.
- **EC2 Instances**: Two instances running an Nginx web server.
- **Elastic Load Balancer (ELB)**: Distributes traffic between instances.
- **Security Groups**: Controls inbound and outbound traffic.
- **Amazon RDS (PostgreSQL)**: A managed database instance.
- **Amazon S3**: A storage bucket for web content.

## Features Implemented
- Automated infrastructure deployment with Terraform.
- Load balancing for improved availability.
- Secure database with RDS instance.
- Static asset storage using S3.

## Technologies Used
- **Terraform** for infrastructure as code.
- **AWS Services**: VPC, EC2, RDS, S3, ELB.
- **Git & GitHub** for version control.

---

## Setup and Deployment

### Prerequisites
Ensure you have the following installed:
- Terraform
- AWS CLI (configured with IAM credentials)
- Git

### Steps to Deploy
1. **Clone the Repository**:
   ```sh
   git clone https://github.com/your-repository/lab-8-scripting-and-automation.git
   cd lab-8-scripting-and-automation
   ```

2. **Initialize Terraform**:
   ```sh
   terraform init
   ```

3. **Validate and Plan**:
   ```sh
   terraform validate
   terraform plan
   ```

4. **Apply the Configuration**:
   ```sh
   terraform apply -auto-approve
   ```

5. **Access the Web Application**:
   Retrieve the Load Balancer URL using:
   ```sh
   terraform output
   ```
   Open the provided URL in a browser to check the deployed web app.

---

## Git Workflow

### Initialize Git
```sh
git init
git remote add origin https://github.com/your-repository/lab-8-scripting-and-automation.git
```

### Adding and Committing Changes
```sh
git add .
git commit -m "Initial commit"
```

### Pushing to GitHub
```sh
git pull origin main --rebase
git push -u origin main
```

---

## Clean-up Resources
To destroy the infrastructure and avoid charges:
```sh
terraform destroy -auto-approve
```

## Author
**Denish Akbari**

**Archit Patel**

**Sahil Sorathiya**
