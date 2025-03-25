# LOAD BALANCER
resource "aws_lb" "nginx" {
  name               = "prog8830-Lab-8-${random_id.lb_id.hex}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.load_balancer_sec_group.id]
  subnets            = aws_subnet.public_subnet[*].id
  enable_deletion_protection = false
}

resource "random_id" "lb_id" {
  byte_length = 4
}

resource "aws_lb_target_group" "nginx_target_group" {
  name     = "nginxtargetgroup"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.webapp.id
}

resource "aws_lb_target_group_attachment" "nginx" {
  count            = 2
  target_group_arn = aws_lb_target_group.nginx_target_group.arn
  target_id        = aws_instance.webserver[count.index].id
  port             = 80
}
