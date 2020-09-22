resource "aws_route53_record" "autodiscover" {
  name = "autodiscover.${var.domain}"
  records = [
    "autodiscover.mail.${var.region}.awsapps.com.",
  ]
  ttl     = var.ttl
  type    = "CNAME"
  zone_id = var.zone_id
}

resource "aws_route53_record" "domain_keys" {
  count = local.domain_key_prefixes_count
  name  = "${var.domain_key_prefixes[count.index]}._domainkey.${var.domain}"
  records = [
    "${var.domain_key_prefixes[count.index]}.dkim.amazonses.com.",
  ]
  ttl     = var.ttl
  type    = "CNAME"
  zone_id = var.zone_id
}

resource "aws_route53_record" "mx" {
  name = var.domain
  records = [
    var.mx_record,
  ]
  ttl     = var.ttl
  type    = "MX"
  zone_id = var.zone_id
}

resource "aws_route53_record" "ses_verification" {
  name = "_amazonses.${var.domain}"
  records = [
    var.verification_record,
  ]
  ttl     = var.ttl
  type    = "TXT"
  zone_id = var.zone_id
}

resource "aws_route53_record" "additional_records" {
  count   = length(var.additional_records)
  name    = var.additional_records[count.index]["hostname"]
  records = split(",", var.additional_records[count.index]["value"])
  ttl     = var.additional_records[count.index]["ttl"]
  type    = var.additional_records[count.index]["record_type"]
  zone_id = var.zone_id
}