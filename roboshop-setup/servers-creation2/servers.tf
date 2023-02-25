data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}
#access image id by using datasourse

resource "aws_instance" "frontend" {
  count                  = 5
  ami                    = data.aws_ami.ami.image_id
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-0cbce48f1b39fa890"]
  tags = {
    Name = "frontend"
  }
}
