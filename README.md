# Terraform Modules

Repository containing Terraform modules, one per directory.

## Testing

`module_test_boilerplate` contains some common test code, and is not a module in
itself.

Every other directory represents a single module and should be testable by
running the following commands from the module directory using
[bundler](http://bundler.io/):

```
bundle install
bundle exec kitchen test
```
