require 'spec_helper'

describe Visit do

  before(:each) do
    Factory.create(:visit)
  end

  it { should belong_to(:practice_member) }
  it { should belong_to(:visit_view_type) }

  it { should validate_presence_of(:practice_member_id) }

  it { should_not allow_value('').for(:date) }
  it { should_not allow_value(nil).for(:date) }
  it { should_not allow_value(50.years.ago - 1.year).for(:date) }
  it { should allow_value(50.years.ago + 1.year).for(:date) }
  it { should allow_value(Date.today + 50.years - 1.year).for(:date) }
  it { should_not allow_value(Date.today + 50.years + 1.year).for(:date) }
  it { should allow_value('2010-12-31').for(:date) }
  it { should_not allow_value('abcde').for(:date) }

  describe "load todays visit" do

  end

  it "gets a visit, restricted by the current user" do
    practice_one = Factory(:practice_one, :name => 'A Practice')
    practice_two = Factory(:practice_two, :name => 'Another Practice')

    practice_member_practice_one = Factory(:practice_member, :practice => practice_one)
    visit_one = Factory(:visit, :practice_member_id => practice_member_practice_one.id)
    practice_member_practice_two = Factory(:practice_member, :practice => practice_two)
    visit_two = Factory(:visit, :practice_member_id => practice_member_practice_two.id)

    user_one = Factory(:practice_admin_user, :practice => practice_one)
    user_two = Factory(:practice_admin_user, :practice => practice_two)
    sysadmin_user = Factory(:sysadmin_user)

    Visit.get_by_id_restricted_by_user(visit_one.id, user_one).id.should == visit_one.id
    Visit.get_by_id_restricted_by_user(visit_two.id, user_one).should == nil

    Visit.get_by_id_restricted_by_user(visit_one.id, sysadmin_user).id.should == visit_one.id
    Visit.get_by_id_restricted_by_user(visit_two.id, sysadmin_user).id.should == visit_two.id
  end
end

