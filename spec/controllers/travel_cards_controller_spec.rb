require 'spec_helper'

describe TravelCardsController do

  describe "PUT update" do

    it "should assign a travel card in the current user's practice" do
      user = login_user('practice_admin_user')
      practice_member = Factory(:practice_member, :practice => user.practice)
      put :update, :id => practice_member.travel_card.id
      assigns(:travel_card).should == practice_member.travel_card
    end

    it "should not assign a practice member not in the current user's practice" do
      user = login_user('practice_admin_user')

      other_practice = Factory(:practice, :name => 'Other Practice')
      practice_member = Factory(:practice_member, :practice_id => other_practice.id)

      put :update, :id => practice_member.travel_card.id
      assigns(:travel_card).should == nil
    end

  end

end
