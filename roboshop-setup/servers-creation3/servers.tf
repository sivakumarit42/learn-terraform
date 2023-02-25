data "aws_ami" "ami" {                                  #access image id by using datasourse
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}

#resource "aws_instance" "frontend" {
#  #count                 = length(var.instances)        #it wont work for nested map
#  for_each               = var.instances
#  ami                    = data.aws_ami.ami.image_id
#  instance_type          = each.value["type"]
#  vpc_security_group_ids = ["sg-0cbce48f1b39fa890"]
#  tags = {
#   # Name=var.instances[count.index]                    #it wont work for nested map
#    Name=each.value["name"]
#  }
#}
#variable "instances" {
#  default = {                                #map of map
#    catalogue = {                            #catalogue and user are key:name and type are value
#      name = "catalogue"
#      type = "t3.micro"
#    },
#    user = {
#      name = "user"
#      type = "t2.small"
#    }
#  }
#}

#little im-matured code
resource "aws_instance" "frontend" {
  count                 = length(var.instances)                  #list of map
  ami                    = data.aws_ami.ami.image_id
  instance_type          = var.instances[count.index]["type"]
  vpc_security_group_ids = ["sg-0cbce48f1b39fa890"]
  tags = {
     Name=var.instances[count.index]["name"]
  }
}

variable "instances" {
  default = [
    {
      name = "catalogue"
      type = "t2.small"
    },
    {
      name = "user"
      type = "t2.small"
    }
  ]
}

