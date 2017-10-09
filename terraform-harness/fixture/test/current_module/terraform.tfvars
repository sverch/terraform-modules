#
# Current Module Test Fixture
#
# This test fixture tells terragrunt to instantiate the module sourced from the
# local module directory.  Here you can express any prerequisites of your module
# as well as pass in static variables.
#
# This framework assumes that your module takes an "environment_name" variable
# that tells it which environment the module is deployed in (dev, qa, prod,
# etc.).  The framework will attempt to pass a unique environment name.
#
terragrunt = {
    terraform {
        source  = "../../.."
    }

    # Include all settings from the root terraform.tfvars file
    include = {
        path = "${find_in_parent_folders()}"
    }

    dependencies {
        paths = ["../example_vpc"]
    }
}
