require 'spec_helper'

describe "practice_members/show.html.erb" do
  before(:each) do
    @practice_member = assign(:practice_member, stub_model(PracticeMember,
      :practice_id => 1,
      :name_last => "Name Last",
      :name_first => "Name First",
      :name_middle => "Name Middle"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(1.to_s)
    rendered.should contain("Name Last".to_s)
    rendered.should contain("Name First".to_s)
    rendered.should contain("Name Middle".to_s)
  end
end
