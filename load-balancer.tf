# LOAD BALANCER
resource "aws_lb" "nginx" {
  name               = "prog8830-Lab-8-${random_id.lb_id.hex}"  # Unique load balancer name
  internal           = false  # Public-facing load balancer
  load_balancer_type = "application"  # ALB type
  security_groups    = [aws_security_group.load_balancer_sec_group.id]  # Security group
  subnets            = aws_subnet.public_subnet[*].id  # Attach to public subnets
  enable_deletion_protection = false  # Allow deletion
}

# Random ID for unique load balancer name
resource "random_id" "lb_id" {
  byte_length = 4  # Generates a random 4-byte hex value
}

# Target group for load balancing
resource "aws_lb_target_group" "nginx_target_group" {
  name     = "nginxtargetgroup"  # Target group name
  port     = 80  # Listen on port 80
  protocol = "HTTP"  # HTTP traffic
  vpc_id   = aws_vpc.webapp.id  # Associate with VPC
}

# Attach instances to the target group
resource "aws_lb_target_group_attachment" "nginx" {
  count            = 2  # Attach both instances
  target_group_arn = aws_lb_target_group.nginx_target_group.arn  # Target group
  target_id        = aws_instance.webserver[count.index].id  # Instance IDs
  port             = 80  # Forward traffic on port 80
}
