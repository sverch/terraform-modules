require 'spec_helper.rb'

describe vpc('kitchen-test') do
  it { should exist }
end
