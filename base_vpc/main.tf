provider "aws" {
    region = "${var.aws_region}"
}

terraform {
    backend "s3" {}
}

resource "aws_vpc" "main" {
    cidr_block = "${var.cidr_block}"

    tags = {
        environment = "${var.env_name}"
    }
}
