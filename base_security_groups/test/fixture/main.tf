variable "env_name" { }

module "vpc" {
    source  = "github.com/sverch/terraform-modules//base_vpc?ref=master"
    env_name = "${var.env_name}"
}

# This is a hack that we need because of the way we express dependencies between
# modules.
#
# Because Terragrunt by design doesn't have a way to pass variables between
# modules (which allows each piece to be deployed independently), the suggested
# solution is to use Terraform data sources to dynamically discover dependent
# resources: https://github.com/gruntwork-io/terragrunt/issues/116.
#
# While this works well for Terragrunt because it has its own way to express
# dependencies between components, it is problematic here because Test Kitchen
# does not have any clear equivalent.  Someone seems to be trying this, but it
# looks pretty complex: https://github.com/gruntwork-io/terragrunt/issues/193.
#
# So in order to force the dependent module to run only after the dependencies
# have been created, we have to make Terraform think that the dependent module
# is being passed a value that must be "computed" based on its dependencies.
# Using this "null_data_resource" pass through does just that.  See
# https://www.terraform.io/docs/configuration/data-sources.html#data-source-lifecycle.
data "null_data_source" "dependent" {
  depends_on = ["module.vpc"]
  inputs = {
    env_name = "${var.env_name}"
  }
}

module "security_group" {
    # This is actually terrible, because it's relative to where
    # kitchen-terraform copies these files, not relative to where it is in the
    # repo...
    source = "../../.."
    env_name = "${data.null_data_source.dependent.inputs.env_name}"
}
