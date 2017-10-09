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
