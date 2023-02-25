resource "aws_instance" "myec2" {
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
   # key    = "06-statefile/terraform.tfstate"
    key    = "learn-terraform/06-statefile/terraform.tfstate"
    region = "us-east-1"
  }
}

