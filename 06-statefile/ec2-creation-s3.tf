resource "aws_instance" "statefile" {
  ami                    = "ami-0a017d8ceb274537d"
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-0cbce48f1b39fa890"]
  tags = {
    Name = "demo-instance-statefile"
  }
}

terraform {
  backend "s3" {
    bucket = "mys3bucketb72"
    key    = "s3://mys3bucketb72/statefile_1/"
    region = "us-east-1"
  }
}
