require 'spec_helper'

describe "feature_requests/show.html.erb" do
  before(:each) do
    @feature_request = assign(:feature_request, stub_model(FeatureRequest,
      :name => "Name",
      :description => "MyText",
      :notes => "MyText",
      :times_requested => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
