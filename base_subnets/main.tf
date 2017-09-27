provider "aws" {
    region = "${var.aws_region}"
}

data "aws_vpc" "base" {
    tags = {
        environment = "${var.env_name}"
    }
}

data "aws_availability_zones" "available" {}

resource "aws_subnet" "base" {
    count      = "${length(data.aws_availability_zones.available.names)}"
    vpc_id     = "${data.aws_vpc.base.id}"
    availability_zone = "${element(data.aws_availability_zones.available.names, count.index)}"
    cidr_block = "${cidrsubnet(data.aws_vpc.base.cidr_block, 2, count.index)}"

    tags = {
        environment = "${var.env_name}"
    }
}
