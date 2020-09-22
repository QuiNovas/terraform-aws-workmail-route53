# terraform-aws-workmail-route53

This module makes easy to put all verification and other workmail dns records on AWS Route53. 

## Example Usage
```hcl
module "workmail_route53" {
  source = "QuiNovas/workmail-route53/aws"

  region              = "us-east-1"
  domain              = "example.com."
  domain_key_prefixes = ["ot6x65j25xmmf7dk62c7ejmvijbdur2d", "ot6x65j25xmmf7dk62c7ejmvijbdur2d", "6n7ethipoh66v5nr2ppsijjzka7ayqgm"]
  mx_record           = "10 inbound-smtp.us-east-1.amazonaws.com."
  verification_record = "vd4QzRkRGKHSDfy9pgt426FVOoNAL1vrW/wG40ybdls="
  zone_id             = "Z3SFKUSQ35F48"

  additional_records = [
    {
      record_type = "TXT"
      ttl         = "3600"
      hostname    = "example.com."
      value       = "v=spf1 include:amazonses.com ~all"

    },
    {
      record_type = "TXT"
      ttl         = "3600"
      hostname    = "_dmarc.example.com."
      value       = "v=DMARC1;p=quarantine;pct=100;fo=1"
    }
  ]
}
```

## Authors

Module managed by Quinovas (https://github.com/QuiNovas)

## License

Apache License, Version 2.0, January 2004 (http://www.apache.org/licenses/). See LICENSE for full details.