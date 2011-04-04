require 'spec_helper'

describe HomeHelper do

  it "should set the maximum stat value to 10 if the value is 0" do
    set_max_stat_value(0).should == 10
    set_max_stat_value(nil).should == 10
  end

  it "should set the maximum stat value to the incoming number plus 50 percent if the incomming number is greater than 0" do
    set_max_stat_value(6).should == 9
  end

end
