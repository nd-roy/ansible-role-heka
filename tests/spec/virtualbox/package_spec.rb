require 'spec_helper'

describe package('daemon') do
  it { should be_installed }
end

describe package('heka') do
  it { should be_installed }
end

describe service('hekad') do
  it { should be_enabled }
  it { should be_running }
end
