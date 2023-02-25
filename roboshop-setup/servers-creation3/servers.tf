data "aws_ami" "ami" {                                  #access image id by using datasourse
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}

resource "aws_instance" "instances" {
  #count                 = length(var.instances)        #it wont work for nested map
  for_each               = var.instances
  ami                    = data.aws_ami.ami.image_id
  instance_type          = each.value["type"]
  vpc_security_group_ids = ["sg-0cbce48f1b39fa890"]
  tags = {
   # Name=var.instances[count.index]                    #it wont work for nested map
    Name=each.value["name"]
  }
}
variable "instances" {
  default = {                                #map of map
    catalogue = {                            #catalogue and user are key:name and type are value
      name = "catalogue"
      type = "t3.micro"
    },
    user = {
      name = "user"
      type = "t2.small"
    }
  }
}
output "ec2" {
  #value = aws_instance.instances["catalogue"].public_ip
   value = [for k, v in aws_instance.instances : "${k} - ${v.public_ip}"]
}

##little matured code
#resource "aws_instance" "frontend" {
#  count                 = length(var.instances)                  #list of map
#  ami                    = data.aws_ami.ami.image_id
#  instance_type          = var.instances[count.index]["type"]
#  vpc_security_group_ids = ["sg-0cbce48f1b39fa890"]
#  tags = {
#     Name=var.instances[count.index]["name"]
#  }
#}
#
#variable "instances" {
#  default = [
#    {
#      name = "catalogue"
#      type = "t1.micro"
#    },
#    {
#      name = "user"
#      type = "t1.micro"
#    }
#  ]
#}
#
## im-matured code
#resource "aws_instance" "frontend" {
#  count                 = length(var.name)                  #list of variables
#  ami                    = data.aws_ami.ami.image_id
#  instance_type          = var.type[count.index]
#  vpc_security_group_ids = ["sg-0cbce48f1b39fa890"]
#  tags = {
#    Name=var.name[count.index]
#  }
#}
#
#variable "name" {
#  default = [ "catalogue", "user" ]
#}
#variable "type" {
#  default = [ "t2.micro", "t3.micro" ]
#}