output "rds_public_hostname" {
  value = aws_db_instance.postgres_db.address
}

output "rds_port" {
  value = aws_db_instance.postgres_db.port
}

output "lowercase_bucket_name" {
  value = lower(aws_s3_bucket.web_bucket.bucket)
}

output "subnet_count" {
  value = length(aws_subnet.public_subnet)
}
