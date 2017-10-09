require 'spec_helper.rb'

environment_name = ENV.fetch("AWSPEC_ENVIRONMENT_NAME")

describe vpc(environment_name) do
  it { should exist }
  its('cidr_block') { should eq "10.0.0.0/16" }
end
