resource "aws_s3_bucket" "web_bucket" {
  bucket = "prog8830-lab-8-${random_id.s3_id.hex}"
  force_destroy = true
}

resource "random_id" "s3_id" {
  byte_length = 4
}

resource "aws_s3_object" "web_content" {
  for_each = fileset("./webcontent", "*")
  bucket   = aws_s3_bucket.web_bucket.bucket
  key      = "/webcontent/${each.value}"
  source   = "./webcontent/${each.value}"
}
