require 'spec_helper.rb'

env_name = ENV.fetch("AWSPEC_ENVIRONMENT_NAME")

describe vpc(env_name) do
  it { should exist }
  its('cidr_block') { should eq "10.0.0.0/16" }
end

describe subnet("#{env_name}-0") do
  it { should exist }
end

describe subnet("#{env_name}-1") do
  it { should exist }
end

describe subnet("#{env_name}-2") do
  it { should exist }
end

describe subnet("#{env_name}-3") do
  it { should_not exist }
end
