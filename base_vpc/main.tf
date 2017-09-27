provider "aws" {
    region = "${var.aws_region}"
}

resource "aws_vpc" "main" {
  cidr_block = "${var.cidr_block}"
}
