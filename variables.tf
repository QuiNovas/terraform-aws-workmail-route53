variable "region" {
  description = "Region where workmail is being setup. Currently it is supported in 3 regions only"
  type        = string
  default     = "us-east-1"
}

variable "domain" {
  description = "Domain name"
  type        = string
}

variable "domain_key_prefixes" {
  description = "Recommended CNAME records for mail setup"
  type        = list(string)
}

variable "mx_record" {
  description = "MX record required for Mail Setup"
  type        = string
}

variable "verification_record" {
  description = "TXT (_amazonses records) required for Domain ownership. Caution: TXT values can be coming SES domain verfication too. You can put that here or manage this outside"
  type        = any
  default     = ""
}

variable "zone_id" {
  description = "Hosted Zone id of Workmail Domain"
  type        = string
}

variable "ttl" {
  description = "ttl for all of the records"
  type        = string
  default     = "3600"
}

variable "additional_records" {
  description = "Additional recommended records. List of maps, keys: record_type, ttl, hostname, value"
  type        = list
  default     = []
}
