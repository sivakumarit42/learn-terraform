resource "null_resource" "d1" {
  count = var.d1
}
variable "d1" {
  default = 5
}

resource "null_resource" "d2" {
  count = length(var.d2)
}
variable "d2" {
  default = ["apple", "banana","fruit7"]
}

output "d2_FRUITS" {
  #value = [for i in var.d2 : upper(i)]  #output will print in uppercase
  value = var.d2
}

resource "null_resource" "d3" {
  for_each = var.d3                  #for_each command is used to access map of map variables
  #count = var.d3                    #here count wont work because d3 variables has 2 attributes
}

variable "d3" {
  default = {
    apple = {
      name  = "fruit"
      count = 3
    }
    banana = {
      name  = "fruit2"
      count = 30
    }
  }
}

output "d3_fruits" {
  value = var.d3
 # value = var.d3.apple
  #value = var.d3.apple.count
  #value = var.d3.apple.name
  #value = var.d3.banana
  #value = var.d3.banana.name
  #value = var.d3.banana.count
  #value = var.d3.*  it will print all details of apple and banana
}