require 'spec_helper'

describe "practice_members/index.html.erb" do
  before(:each) do
    assign(:practice_members, [
      stub_model(PracticeMember,
        :practice_id => 1,
        :name_last => "Name Last",
        :name_first => "Name First",
        :name_middle => "Name Middle"
      ),
      stub_model(PracticeMember,
        :practice_id => 1,
        :name_last => "Name Last",
        :name_first => "Name First",
        :name_middle => "Name Middle"
      )
    ])
  end

  it "renders a list of practice_members" do
    render
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Name Last".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Name First".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Name Middle".to_s, :count => 2)
  end
end
