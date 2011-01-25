require 'spec_helper'

describe "Lineup" do
  
  it "should recieve new practice member id's and return them in array form" do
    lineup = Lineup.new(LINEUP_DURATION_OF_STAY_MINUTES)
    lineup << 100
    lineup.current.should == [100]
    lineup << 101
    lineup.current.each{|pm| [100,101].include?(pm).should == true}
  end
  
  it "should return practice member id's added within a given time period and purge those that are older" do
    lineup = Lineup.new(-1)
    lineup << 100
    lineup.current.empty?.should == true
    lineup << 101
    lineup.current.empty?.should == true
  end
  
  it "should update the time of entry of a practice member if input again" do
    lineup = Lineup.new(LINEUP_DURATION_OF_STAY_MINUTES)
    lineup << 100
    practice_member_hash = lineup.send(:practice_members)
    first_entry_time = practice_member_hash[100][:entry_time]
    sleep(1)
    lineup << 100
    practice_member_hash = lineup.send(:practice_members)
    second_entry_time = practice_member_hash[100][:entry_time]
    
    second_entry_time.should > first_entry_time
  end
  
end
