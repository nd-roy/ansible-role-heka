require 'spec_helper'

describe package('deamon') do
  it { should be_installed }
end

describe package('heka') do
  it { should be_installed }
end
