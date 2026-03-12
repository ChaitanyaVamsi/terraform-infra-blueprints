resource "aws_route53_record" "sample" {
  count = length(var.instances)
  zone_id = var.zone_id
  name = "${var.instances[count.index]}.${var.domain_name}"
  type = "A"
  ttl = 1
  records = [aws_instance.web_server.private_ip]
  allow_overwrite = true
}