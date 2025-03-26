# S3 BUCKET CONFIGURATION

# Create an S3 bucket with a unique name
resource "aws_s3_bucket" "web_bucket" {
  bucket        = "prog8830-lab-8-${random_id.s3_id.hex}"  # Unique bucket name using a random ID
  force_destroy = true  # Allows deletion of the bucket even if it contains objects
}

# Generate a random ID for the bucket name
resource "random_id" "s3_id" {
  byte_length = 4  # Generates a random 4-byte hex value
}

# Upload web content to the S3 bucket
resource "aws_s3_object" "web_content" {
  for_each = fileset("./webcontent", "*")  # Iterate over all files in the 'webcontent' directory
  bucket   = aws_s3_bucket.web_bucket.bucket  # Upload to the created S3 bucket
  key      = "/webcontent/${each.value}"  # Set the object key (path in S3)
  source   = "./webcontent/${each.value}"  # Specify the local source file
}
