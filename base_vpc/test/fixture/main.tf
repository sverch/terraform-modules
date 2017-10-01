variable "env_name" { }

module "vpc" {
    # This is actually terrible, because it's relative to where
    # kitchen-terraform copies these files, not relative to where it is in the
    # repo...
    source = "../../.."
    env_name = "${var.env_name}"
}
