#
# Example Test Fixture Dependency
#
# This is an example of a dependency that you might have in your test fixture.
# This will be pulled in by terragrunt as the test is run, and can use
# terragrunt to express that this module must be instantiated before yours.
#
terragrunt = {
    terraform {
        source  = "github.com/sverch/terraform-modules.git//example_vpc?ref=master"
    }

    # Include all settings from the root terraform.tfvars file
    include = {
        path = "${find_in_parent_folders()}"
    }
}

cidr_block = "10.1.0.0/16"
