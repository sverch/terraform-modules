# Example Security Groups Module

This module automatically discovers a VPC with a `Name` tag matching the
`env_name` input parameter, and creates a base security group inside it.

This security group is created with an `environment` tag with the environment
name, and a `Name` tag that is also the environment name, because awspec needs
this to discover it.

## Testing

See [Testing](../README.md#testing) for details.
