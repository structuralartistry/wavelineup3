require 'spec_helper'

describe ActivationsController do

  before(:each) do
    Practice.delete_all
  end

  describe "POST create" do
    it "just goes ahead and logs me in if my user is already activated" do
      user = Factory.create(:practice_admin_user)
      user.reset_perishable_token!
      post :create, :activation_code => user.perishable_token
      flash[:notice].should match "This user is already active. You have been logged in to the system."
    end
    
    it "logs me in and tells me my user is activated if my user has not yet been activated and I submit a good link" do
      user = Factory.create(:practice_admin_user, :active => false)
      user.reset_perishable_token!
      post :create, :activation_code => user.perishable_token
      flash[:notice].should match "Your account has been activated"      
    end
    
    # not sure what circumstance will cause (if ever) this event... implement once we are wiser
    # it "sends me a new activation code if the user activation fails" do
    #   flash[:notice].should match "User failed to be activated. We are sending a new activation link to #{@user.email}. If you continue to recieve this message with the new link, please contact support."
    # end
    
    it "informs me that the user does not exist if the activation code does not match a user" do
      user = Factory.create(:practice_admin_user, :active => false)
      post :create, :activation_code => "bugaboo"
      flash[:notice].should match "User does not exist"
    end
  end

end