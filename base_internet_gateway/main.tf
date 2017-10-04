provider "aws" {
    region = "${var.aws_region}"
}

terraform {
    backend "s3" {}
}

data "aws_vpc" "base" {
    filter {
        name = "tag:environment"
        values = ["${var.env_name}"]
    }
}

resource "aws_internet_gateway" "base" {
    vpc_id = "${data.aws_vpc.base.id}"

    tags = {
        # Need this for now, because awspec only searches by name.  See:
        # https://github.com/k1LoW/awspec/issues/224
        #
        # Looks like https://github.com/k1LoW/awsrm is an attempt to fix this.
        Name = "${var.env_name}"
        environment = "${var.env_name}"
    }
}

data "aws_route_table" "base" {
    vpc_id = "${data.aws_vpc.base.id}"
}

resource "aws_route" "base" {
    route_table_id = "${data.aws_route_table.base.route_table_id}"
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.base.id}"
}
