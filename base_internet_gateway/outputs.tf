output "internet_gateway_id" {
    description = "The id of the internet gateway created"
    value = "${aws_internet_gateway.base.id}"
}
