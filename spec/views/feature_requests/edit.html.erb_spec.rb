require 'spec_helper'

describe "feature_requests/edit.html.erb" do
  before(:each) do
    @feature_request = assign(:feature_request, stub_model(FeatureRequest,
      :name => "MyString",
      :description => "MyText",
      :notes => "MyText",
      :times_requested => 1
    ))
  end

  it "renders the edit feature_request form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => feature_requests_path(@feature_request), :method => "post" do
      assert_select "input#feature_request_name", :name => "feature_request[name]"
      assert_select "textarea#feature_request_description", :name => "feature_request[description]"
      assert_select "textarea#feature_request_notes", :name => "feature_request[notes]"
      assert_select "input#feature_request_times_requested", :name => "feature_request[times_requested]"
    end
  end
end
