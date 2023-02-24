# String Data type
variable "sample1" {
  default = "Hello World"
}
output "sample1-output-is" {
  value = var.sample1
}

# Number data type
variable "sample2" {
  default = 100
}
output "sample2_output_is" {
  value = "the output of sample2 is- ${sample2}"
}
# Boolean Data type
variable "sample3" {
  default = true
}
output "sample3" {
  value = var.sample3
  ##value = "the output of sample3 is: ${sample3}"
}