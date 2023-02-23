variable "sample" {
  default = "hello siva"
}
output "sample1" {
  value = var.sample
}
variable "sample-new" {
  default = "hello strong man"
}
output "sample-new" {
  value = var.sample-new
}

variable "sample2" {

}
output "sample2" {
  value = var.sample2
}


#getting input from user by using cli, input commands
variable "cli" {}
output "cli" {
  value = var.cli
}
variable "input" {}
output "input" {
  value = var.input}
