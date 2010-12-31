require 'spec_helper'

describe Visit do
  
  before(:each) do
    Factory.create(:visit)
  end
  
  it { should belong_to(:practice_member) }
  
  it { should validate_presence_of(:date) }
  it { should allow_value('2010-12-31').for(:date) }
  it { should_not allow_value('12/31/2010').for(:date) }
  it { should_not allow_value('abcde').for(:date) }
  
  
  describe "load todays visit" do
    
  end
  
end

