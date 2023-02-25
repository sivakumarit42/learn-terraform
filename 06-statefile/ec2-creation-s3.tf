

resource "aws_instance" "myec2" {
  ami                    = "ami-0a017d8ceb274537d"
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-0cbce48f1b39fa890"]
  tags = {
    Name = "demo10"
  }
}

terraform {
  backend "s3" {
    bucket = "mys3bucketb72"
    key    = "06-statefile/terraform.tfstate"                    #Here the file name is our choice.file name is inside one folder.
    #key    = "learn-terraform/06-statefile/terraform.tfstate"    #Here the file name is our choice.file name is inside 2 folder.
    #key     ="statefile"                                          #Here the file name is our choice,we can give any name with or without folder
    region = "us-east-1"
  }
}
