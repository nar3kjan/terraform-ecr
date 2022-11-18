data "aws_route53_zone" "my_zone" {
  name         = var.domain_name
  private_zone = false
}


module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name  = var.domain_name
  zone_id      = data.aws_route53_zone.my_zone.id

  subject_alternative_names = var.subject_alternative_names

  wait_for_validation = true

  tags = {
    Name = var.domain_name
  }
}


resource "aws_route53_record" "www_elb" {
  zone_id = data.aws_route53_zone.my_zone.id
  name    = "www"
  type    = "A"

  alias {
    name                   = module.alb.lb_dns_name
    zone_id                = module.alb.lb_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "elb" {
  zone_id = data.aws_route53_zone.my_zone.id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = module.alb.lb_dns_name
    zone_id                = module.alb.lb_zone_id
    evaluate_target_health = true
  }
}
