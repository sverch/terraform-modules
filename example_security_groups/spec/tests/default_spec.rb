require 'spec_helper.rb'

environment_name = ENV.fetch("AWSPEC_ENVIRONMENT_NAME")

describe vpc(environment_name) do
  it { should exist }
  its('cidr_block') { should eq "10.1.0.0/16" }
end

describe security_group(environment_name) do
  it { should exist }
  its(:outbound) { should be_opened }
  its(:inbound) { should be_opened }
end
