variable "environment_name" {
    description = "The name of the environment being deployed"
    default = "test"
}

variable "aws_region" {
    description = "The region to deploy to"
    default = "us-east-1"
}

variable "cidr_block" {
    description = "The CIDR block of this VPC"
    default = "10.0.0.0/16"
}
