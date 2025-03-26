# NETWORKING

# Create a Virtual Private Cloud (VPC)
resource "aws_vpc" "webapp" {
  cidr_block           = "10.0.0.0/16"  # Define VPC IP range
  enable_dns_hostnames = true  # Enable DNS resolution for instances
}

# Internet Gateway for public access
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.webapp.id  # Attach to VPC
}

# Create two public subnets
resource "aws_subnet" "public_subnet" {
  count                   = 2  # Create two subnets
  vpc_id                  = aws_vpc.webapp.id  # Associate with VPC
  cidr_block              = cidrsubnet("10.0.0.0/16", 8, count.index)  # Subnet IP allocation
  map_public_ip_on_launch = true  # Assign public IPs
  availability_zone        = element(["us-east-1a", "us-east-1b"], count.index)  # AZ selection
}

# Create a public route table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.webapp.id  # Associate with VPC
  
  route {
    cidr_block = "0.0.0.0/0"  # Allow all outbound traffic
    gateway_id = aws_internet_gateway.internet_gateway.id  # Route through internet gateway
  }
}

# Associate subnets with the public route table
resource "aws_route_table_association" "public_subnet_route_table" {
  count          = 2  # Apply to both subnets
  subnet_id      = aws_subnet.public_subnet[count.index].id  # Associate each subnet
  route_table_id = aws_route_table.public_route_table.id  # Use public route table
}

# Create a DB subnet group for database instances
resource "aws_db_subnet_group" "public_subnet_group" {
  name       = "public-subnet-group"  # Name of the subnet group
  subnet_ids = aws_subnet.public_subnet[*].id  # Associate with public subnets
}
