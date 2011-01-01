require 'spec_helper'

describe TravelCard do
  
  before(:each) do 
    Factory.create(:travel_card)
  end
    
  it { should belong_to(:practice_member) }
  
  it { should validate_presence_of(:practice_member_id) }

end
