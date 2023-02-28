##module declaration
#module "ec2-instances" {
#  source = "./ec2"         #./ indicates current directory
#  component = "frontend"   #/ single instance creation
#}

#module declaration
module "ec2-instances" {
  source        = "./ec2"         #./ indicates current directory
  for_each      = var.instances
  instance-type = each.value["type"]
  component     = each.value["name"]
  sg-id         = module.sg.sg_id
}
module "sg" {
  source = "./sg"         #./ indicates current directory
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