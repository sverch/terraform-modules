# Terraform Modules

Repository containing Terraform modules, one per directory.

This also contains terraform test boilerplate based on Terragrunt and Awspec,
which you can find in `terraform-harness`.

## Run Tests

```
cd <module_directory>
./test
```

This will display the testing options.  The modules prefixed with `example_`, as
well as the example tests in the `terraform-harness` directory should all be
runnable in the AWS free tier, as they do not spin up anything that costs money.

## Create New Module

```
mkdir <module_name>
cd <module_name>
../terraform-harness/setup
```

This will symlink the test boilerplate files from `terraform-harness` as well as
copy over an example test, test fixture, and module code that passes the tests.

## Module Style

These modules are all written with Terragrunt in mind, which means that they
communicate with each other using Terraform `data` resources rather than by
relying on passing parameters between modules.

This makes the modules hard to use without Terragrunt because Terraform can't
tell which modules depend on each other, but the advantage is that they are
loosely coupled and independently deployable when using Terragrunt.
