data "aws_ami" "test" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]

}
output "ami-id" {
  value = data.aws_ami.test.image_id
}
data "aws_ami" "ami" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]

}
output "ami-id_new" {
  value = data.aws_ami.ami.image_id
}