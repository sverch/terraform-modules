provider "aws" {
    region = "${var.aws_region}"
}

terraform {
    backend "s3" {}
}

resource "aws_vpc" "example" {
    cidr_block = "${var.cidr_block}"

    tags = {
        # Need this for now, because awspec only searches by name.  See:
        # https://github.com/k1LoW/awspec/issues/224
        #
        # Looks like https://github.com/k1LoW/awsrm is an attempt to fix this.
        Name = "${var.environment_name}"
        environment = "${var.environment_name}"
    }
}

resource "aws_internet_gateway" "example" {
    vpc_id = "${aws_vpc.example.id}"

    tags = {
        # Need this for now, because awspec only searches by name.  See:
        # https://github.com/k1LoW/awspec/issues/224
        #
        # Looks like https://github.com/k1LoW/awsrm is an attempt to fix this.
        Name = "${var.environment_name}"
        environment = "${var.environment_name}"
    }
}

resource "aws_route" "example" {
    route_table_id = "${aws_vpc.example.default_route_table_id}"
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.example.id}"
}
