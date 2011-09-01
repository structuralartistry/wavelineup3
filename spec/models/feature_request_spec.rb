require 'spec_helper'

describe FeatureRequest do

  it "should not return unrecently implemented features", :focus => true do
    feature_request = Factory(:feature_request)
    FeatureRequest.recently_implemented.empty?.should == true
  end

  it "should return recently implemented features" do
    feature_request = Factory(:feature_request_implemented)
    FeatureRequest.recently_implemented.include?(feature_request).should == true
  end

end
