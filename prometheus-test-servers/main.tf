resource "aws_spot_instance_request" "node1" {
  ami                    = "ami-048ce8b26a6a9b9af"
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-0cbce48f1b39fa890"]
  subnet_id = "subnet-06e66b15398a94047"
  wait_for_fulfillment   = true

  tags = {
    Name = "prometheus-test-server"
  }
}

resource "aws_ec2_tag" "node1" {
  resource_id = aws_spot_instance_request.node1.spot_instance_id
  key         = "Name"
  value       = "prometheus-test-server"
}

resource "aws_spot_instance_request" "node2" {
  ami                    = "ami-048ce8b26a6a9b9af"
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-0cbce48f1b39fa890"]
  subnet_id = "subnet-06e66b15398a94047"
  wait_for_fulfillment   = true

  tags = {
    Name = "prometheus-test-node"
  }
}

resource "aws_ec2_tag" "node2" {
  resource_id = aws_spot_instance_request.node2.spot_instance_id
  key         = "Name"
  value       = "prometheus-test-node"
}