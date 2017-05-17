terraform {
  backend "atlas" {
    name = "nathan-hashicorp/ghe-tf-demo"
  }
}

provider "aws" {
  access_key = "${var.AWS_ACCESS_KEY_ID}"
  secret_key = "${var.AWS_SECRET_ACCESS_KEY}"
  region     = "${var.AWS_DEFAULT_REGION}"
}

resource "aws_keypair" "ghe-tf-demo" {
  key_name   = "ghe-tf-demo"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFGjXK1nKnGIIg7LERaDkBegCGFrTHgZ0d81f3kzifRINj2UjV9I5kWAMO9M3USfN0iwy/GFn95obmDj3M5gH+1/U8pP3UtP/J6XTrEcwiv63sSS+i1ib3cDeswoqTqDUbu89PncyfRCobkUHrXJWzY/5CEfXtDkBqCPMTQuV3sL+lueWHP1yV2HYSlpq/R+aS8y6DBx4lTRlkOODSRdmkWQg23HfpcWR3uzUeu5wcmVFEpjRbFwVwhLtARCYGVb5dPs65WbD+g6j47fpXjYcSTdSqa29QC5iQJDHOhcgnCVLlxybRLZA8nAtFgQyrFXRVYy2IDUStfo6KoreMkNT1"
}
