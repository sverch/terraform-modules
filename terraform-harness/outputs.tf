output "subnet_cidrs" {
    description = "The cidrs of subnets that were created"
    value = "${aws_subnet.example.*.cidr_block}"
}
