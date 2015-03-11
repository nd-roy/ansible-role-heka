require 'spec_helper'

describe port(4352) do
  it { should be_listening }
end

describe port(5565) do
  it { should be_listening }
end
