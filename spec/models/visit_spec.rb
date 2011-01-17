require 'spec_helper'

describe Visit do
  
  before(:each) do
    Factory.create(:visit)
  end
  
  it { should belong_to(:practice_member) }
  
  it { should validate_presence_of(:practice_member_id) }
  
  it { should_not allow_value('').for(:date) }
  it { should_not allow_value(nil).for(:date) }
  it { should_not allow_value(50.years.ago - 1.year).for(:date) }
  it { should allow_value(50.years.ago + 1.year).for(:date) }
  it { should allow_value(Date.today + 50.years - 1.year).for(:date) }
  it { should_not allow_value(Date.today + 50.years + 1.year).for(:date) }
  it { should allow_value('2010-12-31').for(:date) }
  it { should_not allow_value('abcde').for(:date) }
  
  
  
  
  describe "load todays visit" do
    
  end
  
end

