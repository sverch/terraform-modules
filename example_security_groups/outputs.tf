output "security_group_id" {
    description = "The id of the security group that was created"
    value = "${aws_security_group.example.id}"
}
