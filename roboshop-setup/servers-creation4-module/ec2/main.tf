data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}
#access image id by using datasourse

resource "aws_instance" "ec2" {
  ami                    = data.aws_ami.ami.image_id
  instance_type          = var.instance-type
  vpc_security_group_ids = ["sg-0cbce48f1b39fa890"]
  tags = {
    Name =var.component
  }
}
resource "aws_route53_record" "record" {
  zone_id = "Z04370391Z7FE49YGIYQ7"
  name    = "${var.component}.devopsb72.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.ec2.private_ip]
}

variable "component" {}
variable "instance-type" {}
