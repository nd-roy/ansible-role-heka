require 'spec_helper'

describe port(4352) do
  it { should be_listening }
end
