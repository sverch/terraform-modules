output "cidr_block" {
    description = "The CIDR block of this VPC"
    value = "${aws_vpc.main.cidr_block}"
}
