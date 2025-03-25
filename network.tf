# NETWORKING
resource "aws_vpc" "webapp" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.webapp.id
}

resource "aws_subnet" "public_subnet" {
  count                   = 2
  vpc_id                  = aws_vpc.webapp.id
  cidr_block              = cidrsubnet("10.0.0.0/16", 8, count.index)
  map_public_ip_on_launch = true
  availability_zone        = element(["us-east-1a", "us-east-1b"], count.index)
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.webapp.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
}

resource "aws_route_table_association" "public_subnet_route_table" {
  count          = 2
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_db_subnet_group" "public_subnet_group" {
  name       = "public-subnet-group"
  subnet_ids = aws_subnet.public_subnet[*].id
}
