#module declaration
module "ec2-instances" {
  source = "./ec2"         #./ indicates current directory
  component = "frontend"
}

