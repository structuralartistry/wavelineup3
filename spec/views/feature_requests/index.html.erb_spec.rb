require 'spec_helper'

describe "feature_requests/index.html.erb" do
  before(:each) do
    assign(:feature_requests, [
      stub_model(FeatureRequest,
        :name => "Name",
        :description => "MyText",
        :notes => "MyText",
        :times_requested => 1
      ),
      stub_model(FeatureRequest,
        :name => "Name",
        :description => "MyText",
        :notes => "MyText",
        :times_requested => 1
      )
    ])
  end

  it "renders a list of feature_requests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
