variable "aws_profile" {}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config {
    key     = "${var.environment}/vpc/terraform.tfstate"
    bucket  = "${var.org_name}-global-terraform-state"
    region  = "${var.aws_region}"
    profile = "${var.aws_profile}"
  }
}

data "terraform_remote_state" "sg" {
  backend = "s3"
  config {
    key     = "${var.environment}/sg/terraform.tfstate"
    bucket  = "${var.org_name}-global-terraform-state"
    region  = "${var.aws_region}"
    profile = "${var.aws_profile}"
  }
}
