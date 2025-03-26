# AWS provider configuration
provider "aws" {
  region = "us-east-1"  # AWS region
}

# Create two EC2 instances
resource "aws_instance" "webserver" {
  count         = 2  # Number of instances
  ami           = "ami-084568db4383264d4"  # AMI ID
  instance_type = "t3.micro"  # Instance type

  vpc_security_group_ids = [aws_security_group.load_balancer_sec_group.id]  # Security group
  subnet_id              = element(aws_subnet.public_subnet[*].id, count.index)  # Assign subnet

  user_data = file("./setup-nginx.sh")  # Run setup script
}

# IAM profile for instances
resource "aws_iam_instance_profile" "nginx_profile" {
  name = "nginx_profile"  # IAM profile name
  role = "LabRole"  # Assigned IAM role
}
