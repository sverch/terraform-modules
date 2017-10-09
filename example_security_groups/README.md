# Example Security Groups Module

This module automatically discovers a VPC with a `Name` tag matching the
`environment_name` input parameter, and creates an example security group inside it.

This security group is created with an `environment` tag with the environment
name, and a `Name` tag that is also the environment name, because awspec needs
this to discover it.

## Testing

See [Testing](../README.md#testing) for details.
