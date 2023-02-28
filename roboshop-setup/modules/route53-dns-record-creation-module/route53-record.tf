resource "aws_route53_record" "record" {
  zone_id = "Z04370391Z7FE49YGIYQ7"
  name    = "${var.component}.devopsb72.online"
  type    = "A"
  ttl     = 30
  records = [var.private_ip]
}

variable "component" {}
variable "private_ip" {}