# SECURITY GROUP FOR LOAD BALANCER

resource "aws_security_group" "load_balancer_sec_group" {
  name   = "load_balancer_sec_group"  # Security group name
  vpc_id = aws_vpc.webapp.id  # Associate with the VPC

  # Ingress rule to allow HTTP traffic (port 80) from any IP
  ingress {
    from_port   = 80  # Allow incoming traffic on port 80
    to_port     = 80
    protocol    = "tcp"  # TCP protocol
    cidr_blocks = ["0.0.0.0/0"]  # Allow access from anywhere
  }

  # Egress rule to allow all outbound traffic
  egress {
    from_port   = 0  # Allow all outgoing traffic
    to_port     = 0
    protocol    = "-1"  # All protocols
    cidr_blocks = ["0.0.0.0/0"]  # Allow to any destination
  }
}
