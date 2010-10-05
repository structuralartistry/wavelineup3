require 'spec_helper'

describe "practice_members/edit.html.erb" do
  before(:each) do
    @practice_member = assign(:practice_member, stub_model(PracticeMember,
      :new_record? => false,
      :practice_id => 1,
      :name_last => "MyString",
      :name_first => "MyString",
      :name_middle => "MyString"
    ))
  end

  it "renders the edit practice_member form" do
    render

    rendered.should have_selector("form", :action => practice_member_path(@practice_member), :method => "post") do |form|
      form.should have_selector("input#practice_member_practice_id", :name => "practice_member[practice_id]")
      form.should have_selector("input#practice_member_name_last", :name => "practice_member[name_last]")
      form.should have_selector("input#practice_member_name_first", :name => "practice_member[name_first]")
      form.should have_selector("input#practice_member_name_middle", :name => "practice_member[name_middle]")
    end
  end
end
