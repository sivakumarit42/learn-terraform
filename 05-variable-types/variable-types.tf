#1.Default variable types
variable "sample" {
  default = "Hello"
}
output "sample" {
  value = "the output is ${var.sample}"
  #value = var.sample
}

#2.list variable type
variable "sample5" {
  default =  [
    "Hello",
    1000,
    true,
    "World"
  ]
}
output "sample5" {
  value = "first and second value of sample1 block:1 is:${var.sample5[0]},2 is:${var.sample5[1]}"
  #value1 = var.sample1[0]
}
#3.Map Variable Type
variable "sample7" {
  default =  {
    string = "Hello",
    number = 100,
    boolean = true
  }
}
output "sample7" {
  value = var.sample7.boolean
  #value1 = var.sample7.string
  #value3 = var.sample7.number

}

