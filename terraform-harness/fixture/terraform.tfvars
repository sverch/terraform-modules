terragrunt = {
    # Configure Terragrunt to automatically store tfstate files in an S3 bucket
    remote_state {
        backend = "s3"
        config {
            encrypt = true
            bucket = "terraform-harness-terraform-state-${get_aws_account_id()}"
            key = "terraform-harness/${get_env("TF_VAR_environment_name", "terraform-harness-unset-environment")}/${path_relative_to_include()}/terraform.tfstate"
            region = "us-east-1"
            dynamodb_table = "terraform-locks"
        }
    }
}
