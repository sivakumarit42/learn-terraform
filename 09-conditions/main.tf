resource "aws_instance" "ec2_instance" {
  ami           = "ami-0a017d8ceb274537d"
  instance_type = var.instance_type == "" ? "t2.micro" : var.instance_type
  tags = {
    Name = "test-server"
  }
}

variable "instance_type" {}

variable "create_instance" {}

resource "aws_instance" "ec2_instance_new" {
  count         = tobool(var.create_instance) ? 1 : 0
  ami           = "ami-0a017d8ceb274537d"
  instance_type = var.instance_type == "" ? "t3.micro" : var.instance_type
  tags = {
    Name = "test-server-new"
  }
}