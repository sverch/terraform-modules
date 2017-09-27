output "subnet_cidrs" {
    description = "The cidrs of subnets that were created"
    value = "${aws_subnet.base.*.cidr_block}"
}
