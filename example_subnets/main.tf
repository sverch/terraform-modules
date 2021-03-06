provider "aws" {
    region = "${var.aws_region}"
}

terraform {
    backend "s3" {}
}

data "aws_vpc" "example" {
    filter {
        name = "tag:environment"
        values = ["${var.environment_name}"]
    }
}

data "aws_availability_zones" "available" {}

resource "aws_subnet" "example" {
    count      = "${min(length(data.aws_availability_zones.available.names), 3)}"
    vpc_id     = "${data.aws_vpc.example.id}"
    availability_zone = "${element(data.aws_availability_zones.available.names, count.index)}"
    cidr_block = "${cidrsubnet(data.aws_vpc.example.cidr_block, 2, count.index)}"

    tags = {
        # Need this for now, because awspec only searches by name.  See:
        # https://github.com/k1LoW/awspec/issues/224
        #
        # Looks like https://github.com/k1LoW/awsrm is an attempt to fix this.
        Name = "${var.environment_name}-${count.index}"
        environment = "${var.environment_name}"
    }
}
