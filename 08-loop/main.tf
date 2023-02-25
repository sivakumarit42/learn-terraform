variable "d1" {
  default = 5
}

resource "null_resource" "d1" {
  count = var.d1
}

variable "d2" {
  default = ["apple", "banana"]
}

resource "null_resource" "d2" {
  count = length(var.d2)
}
output "FRUITS" {
  value = [for i in var.d2 : upper(i)]  #output will print in uppercase
}

variable "d3" {
  default = {
    apple = {
      name  = "mango"
      count = 3
    }
    banana = {
      name  = "blackberry"
      count = 30
    }
  }
}

resource "null_resource" "d3" {
  for_each = var.d3
}

output "d3" {
  value = var.d3.apple
}