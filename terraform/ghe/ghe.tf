variable "aws_default_region" {
  type = "string"
  default = "us-west-2"
}

terraform {
  backend "s3" {
    bucket = "ghe-tf-demo"
    key    = "state/ghe"
    region = "us-west-2"
  }
}

provider "aws" {
  # aws_access_key_id = "${var.AWS_ACCESS_KEY_ID}"
  # aws_secret_access_key = "${var.AWS_SECRET_ACCESS_KEY}"
  region     = "${var.aws_default_region}"
}

provider "github" {
  token = "${var.ghe_token}"
  organization = "${var.ghe_org}"
  base_url = "${var.ghe_url}"
}


################################################################################
## Set up the teams
################################################################################
# resource "github_team" "Engineering" {
#   name = "Engineering"
#   description = "ValentineCorp Engineering team"
#   privacy = "closed"
# }

# resource "github_team" "Support" {
#   name = "Support"
#   description = "ValentineCorp Support team"
#   privacy = "closed"
# }

# resource "github_team" "Operations" {
#   name = "Operations"
#   description = "ValentineCorp Operations team"
#   privacy = "closed"
# }


################################################################################
## Set up the team repos
################################################################################
# resource "github_repository" "12-factor-app" {
#   name = "12-factor-app"
#   description = "Our core app"
# }
  
# resource "github_repository" "support-tickets" {
#   name = "support-tickets"
#   description = "Support tickets for our core app"
# }

# resource "github_repository" "provisioning-portal" {
#   name = "provisioning-portal"
#   description = "Deployment pipeline for the infrastructure portal"
# }




################################################################################
## Set up the repo memberships
################################################################################
resource "github_team_membership" "nrvale0-eng" {
  team_id  = "${github_team.Engineering.id}"
  username = "nrvale0"
  role     = "member"
}

resource "github_team_membership" "nrvale0-support" {
  team_id  = "${github_team.Support.id}"
  username = "nrvale0"
  role     = "member"
}

resource "github_team_membership" "nrvale0-operations" {
  team_id  = "${github_team.Operations.id}"
  username = "nrvale0"
  role     = "member"
}
