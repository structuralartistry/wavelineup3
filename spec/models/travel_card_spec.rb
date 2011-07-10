require 'spec_helper'

describe TravelCard do

  before(:each) do
    Factory.create(:practice_member)
  end

  it { should have_one(:practice_member) }

  it { should validate_presence_of(:practice_member_id) }

  it "gets a travel card, restricted by the current user" do
    practice_one = Factory(:practice_one, :name => 'A Practice')
    practice_two = Factory(:practice_two, :name => 'Another Practice')

    practice_member_practice_one = Factory(:practice_member, :practice => practice_one)
    practice_member_practice_two = Factory(:practice_member, :practice => practice_two)

    user_one = Factory(:practice_admin_user, :practice => practice_one)
    user_two = Factory(:practice_admin_user, :practice => practice_two)
    sysadmin_user = Factory(:sysadmin_user)

    TravelCard.get_by_id_restricted_by_user(practice_member_practice_one.travel_card.id, user_one).id.should == practice_member_practice_one.travel_card.id
    TravelCard.get_by_id_restricted_by_user(practice_member_practice_one.travel_card.id, user_two).should == nil

    TravelCard.get_by_id_restricted_by_user(practice_member_practice_one.travel_card.id, sysadmin_user).id.should == practice_member_practice_one.travel_card.id
    TravelCard.get_by_id_restricted_by_user(practice_member_practice_two.travel_card.id, sysadmin_user).id.should == practice_member_practice_two.travel_card.id
  end

end
