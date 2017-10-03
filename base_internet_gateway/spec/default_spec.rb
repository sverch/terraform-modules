require 'spec_helper.rb'

env_name = ENV.fetch("AWSPEC_ENVIRONMENT_NAME")

describe vpc(env_name) do
  it { should exist }
  its('cidr_block') { should eq "10.0.0.0/16" }
end

describe internet_gateway(env_name) do
  it { should exist }
  it { should be_attached_to(env_name) }
end
