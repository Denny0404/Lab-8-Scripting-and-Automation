# Create a PostgreSQL RDS instance
resource "aws_db_instance" "postgres_db" {
  identifier             = "localpostgresdb"  # Database identifier
  engine                 = "postgres"  # Database engine type
  engine_version         = "16.3"  # PostgreSQL version
  instance_class         = "db.t3.micro"  # Instance size
  allocated_storage      = 5  # Storage size in GB
  username               = "username"  # Database username
  password               = "password"  # Database password

  db_subnet_group_name   = aws_db_subnet_group.public_subnet_group.name  # Subnet group
  vpc_security_group_ids = [aws_security_group.load_balancer_sec_group.id]  # Security group

  publicly_accessible    = true  # Allow public access
  skip_final_snapshot    = true  # Skip snapshot on deletion
}
