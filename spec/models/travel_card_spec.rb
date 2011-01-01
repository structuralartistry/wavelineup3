require 'spec_helper'

describe TravelCard do
  
  before(:each) do 
    Factory.create(:practice_member)
  end
    
  it { should have_one(:practice_member) }
  
  it { should validate_presence_of(:practice_member_id) }

end
