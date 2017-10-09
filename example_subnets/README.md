# Example Subnets Module

This module automatically discovers a VPC with a `Name` tag matching the
`environment_name` input parameter, and creates three subnets inside it.

The subnets are all created with an `environment` tag with the environment name,
and a `Name` tag that also has the environment name and the subnet number,
because awspec needs this to discover it.

## Testing

See [Testing](../README.md#testing) for details.
