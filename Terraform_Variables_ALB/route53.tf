resource "aws_route53_record" "Route53Name" {
  zone_id = var.Route53zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_lb.LoadBalancer.dns_name
    zone_id                = aws_lb.LoadBalancer.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "www" {
  zone_id = var.Route53zone_id
  name    = var.www_domain_name
  type    = "A"

  alias {
    name                   = aws_lb.LoadBalancer.dns_name
    zone_id                = aws_lb.LoadBalancer.zone_id
    evaluate_target_health = true
  }
}