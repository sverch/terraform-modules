# Example Internet Gateway Module

This module automatically discovers a VPC with a `Name` tag matching the
`env_name` input parameter, and attaches an internet gateway to it.

This internet gateway is created with an "environment" tag with the environment
name, and a "Name" tag that also has the environment name, because awspec needs
this to discover it.

## Testing

See [Testing](../README.md#testing) for details.
