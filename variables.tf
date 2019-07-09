variable "domain" {
  type = string
}

variable "domain_key_prefixes" {
  type = list(string)
}

variable "mx_record" {
  type = string
}

variable "verification_record" {
  type = string
}

variable "zone_id" {
  type = string
}

