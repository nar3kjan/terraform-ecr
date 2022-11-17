/*resource "aws_security_group" "dev_sg" {
  name        = "Development SG"
  description = "Development SG"
  vpc_id = module.vpc.vpc_id
  dynamic "ingress" {
    for_each = ["80", "443", "22", "8080"]
    content {
      from_port    = ingress.value
      to_port      = ingress.value
      protocol     = "tcp"
      cidr_blocks  = ["0.0.0.0/0"]

    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
tags = {
      Name = "Security Group Build by Terraform"
      Owner = "Narek Arakelyan"
    } 
}
*/