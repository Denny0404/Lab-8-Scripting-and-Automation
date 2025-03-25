sudo yum update -y
sudo amazon-linux-extras enable nginx1
sudo yum install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
aws s3 sync s3://${aws_s3_bucket.web_bucket.id}/webcontent/ /home/ec2-user/
