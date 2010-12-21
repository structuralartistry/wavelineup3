require 'spec_helper'

describe Invitation do
  
  it { should belong_to(:referring_user) }
  it { should validate_presence_of(:email) }
  it { should allow_value('david.nathan_kahn@gmail.com.mx').for(:email) }
  it { should_not allow_value('david nathan kahn at gmail dot com').for(:email) }
  
end
