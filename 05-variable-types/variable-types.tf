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
variable "sample6" {
  default =  {
    string = "Hello",
    number = 100,
    boolean = true
  }
}
output "sample6" {
  value = "first and second and third value of sample1 block:1 is:${var.sample6[0]},2 is:3,${var.sample6[1]}"
}