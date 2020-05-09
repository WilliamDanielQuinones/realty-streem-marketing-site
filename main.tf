provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

data "aws_caller_identity" "current" {}

locals {
  service_name = "marketing-site"
  domain_name = "realtystreem.com"
}

## s3 bucket where terraform state is kept
terraform {
 backend "s3" {
  encrypt = true
  bucket = "realty-streem-terraform"
  region = "us-east-1"
  key = "marketing-site/terraform.tfstate"
 }
}

resource "aws_lightsail_instance" "marketing-site" {
  name              = "${local.service_name}"
  availability_zone = "us-east-1a"
  blueprint_id      = "wordpress_4_9_8"
  bundle_id         = "nano_2_0"
  tags  = {
    service = "marketing-site"
  }
}

resource "aws_lightsail_domain" "marketing-site" {
  domain_name = "${local.domain_name}"
}

resource "aws_lightsail_static_ip" "marketing-site" {
  name = "marketing-site-ip"
}

resource "aws_lightsail_static_ip_attachment" "marketing-site" {
  static_ip_name = "${aws_lightsail_static_ip.marketing-site.id}"
  instance_name  = "${aws_lightsail_instance.marketing-site.id}"
}
