# OUTPUT VALUES

# Output the public hostname of the RDS database
output "rds_public_hostname" {
  value = aws_db_instance.postgres_db.address  # Retrieves the RDS instance's public address
}

# Output the port number of the RDS database
output "rds_port" {
  value = aws_db_instance.postgres_db.port  # Retrieves the RDS instance's port
}

# Output the S3 bucket name in lowercase
output "lowercase_bucket_name" {
  value = lower(aws_s3_bucket.web_bucket.bucket)  # Converts the S3 bucket name to lowercase
}

# Output the total number of public subnets
output "subnet_count" {
  value = length(aws_subnet.public_subnet)  # Counts the number of public subnets
}
