resource "aws_route53_record" "sample" {
  for_each = aws_instance.web_server
  # count = length(var.instances)
  zone_id = var.zone_id
  name = "${each.key}.${var.domain_name}"
  type = "A"
  ttl = 1
  # records = [aws_instance.web_server.private_ip]
  records = [each.value.private_ip]
  allow_overwrite = true
}