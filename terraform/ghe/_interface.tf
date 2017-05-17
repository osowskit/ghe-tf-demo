variable "ghe_url" {
  type = "string"
}

variable "ghe_org" {
  type = "string"
  default = "NathanCorp"
}

variable "ghe_token" {
  type = "string"
}

variable "aws_default_region" {
  type    = "string"
  default = "us-west-2"
}

variable "aws_secret_access_key" {
  type = "string"
}

variable "aws_access_key_id" {
  type = "string"
}
