require 'spec_helper.rb'

describe vpc('test') do
  it { should exist }
end

describe subnet('test-0') do
  it { should exist }
end

describe subnet('test-1') do
  it { should exist }
end

describe subnet('test-2') do
  it { should exist }
end
