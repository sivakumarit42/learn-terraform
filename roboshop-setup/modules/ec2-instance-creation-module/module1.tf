data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}
#access image id by using datasourse

resource "aws_instance" "ec2" {
  ami                    = data.aws_ami.ami.image_id
  instance_type          = var.instance-type
  vpc_security_group_ids = [var.sg-id]
  tags = {
    Name =var.component
  }
}
variable "component" {}
variable "instance-type" {}
variable "sg-id" {}

output "private_ip" {
  value = aws_instance.ec2.private_ip
}