require 'spec_helper'

describe Login do
  it { should have_many(:users) }
end
