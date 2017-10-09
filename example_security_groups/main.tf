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

resource "aws_security_group" "example" {
    name        = "example"
    description = "Allow all traffic"
    vpc_id     = "${data.aws_vpc.example.id}"

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags {
        # Need this for now, because awspec only searches by name.  See:
        # https://github.com/k1LoW/awspec/issues/224
        #
        # Looks like https://github.com/k1LoW/awsrm is an attempt to fix this.
        Name = "${var.environment_name}"
        environment = "${var.environment_name}"
    }
}

