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