# Update system packages
sudo yum update -y

# Enable Nginx package from Amazon Linux Extras
sudo amazon-linux-extras enable nginx1

# Install Nginx web server
sudo yum install -y nginx

# Start and enable Nginx service to run on boot
sudo systemctl start nginx
sudo systemctl enable nginx

# Sync web content from S3 bucket to the instance's web directory
aws s3 sync s3://${aws_s3_bucket.web_bucket.id}/webcontent/ /home/ec2-user/
