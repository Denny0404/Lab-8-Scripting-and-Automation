resource "aws_db_instance" "postgres_db" {
  identifier             = "localpostgresdb"
  engine                 = "postgres"
  engine_version         = "16.3"
  instance_class         = "db.t3.micro"
  allocated_storage      = 5
  username               = "username"
  password               = "password"
  db_subnet_group_name   = aws_db_subnet_group.public_subnet_group.name
  vpc_security_group_ids = [aws_security_group.load_balancer_sec_group.id]
  publicly_accessible    = true
  skip_final_snapshot    = true
}
