#module declaration
module "ec2-instances" {
  source        = "./ec2-instance-creation-module"                    #./ indicates current directory
  for_each      = var.instances
  instance-type = each.value["type"]
  component     = each.value["name"]
  sg-id         = module.sg.sg_id                                     #access the output from another module
}
module "sg" {
  source = "./sg-creation-module"                                      #./ indicates current directory
}

module "route53-record" {
  source     = "./route53-dns-record-creation-module"
  for_each   = var.instances
  component  = each.value["name"]
  private_ip = module.ec2-instances[each.value["name"]].private_ip    #access the output from another module
}

output "ec2" {                    #just print the output in console
  value = module.ec2-instances
}