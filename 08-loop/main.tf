variable "d1" {
  default = 5
}

resource "null_resource" "nothing" {
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
      name  = "grapes"
      count = 3
    }
    banana = {
      name  = "goa"
      count = 30
    }
  }
}

resource "null_resource" "d3" {
  for_each = var.d3
}

