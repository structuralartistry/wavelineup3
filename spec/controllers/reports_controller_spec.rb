require 'spec_helper'

describe ReportsController do

  before(:each) do
    login_user('practice_admin_user')
  end

  describe "GET 'index'" do
    it "should be successful" do
      get :index
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "should be fail if no practice members and date filter" do
      get :show
      response.should redirect_to(reports_path)
      flash[:notice].should eq('Invalid report request. Please try again.')
    end

    it "should render the report (show) if the correct parameters are supplied" do
      get :show, {:filter_practice_member => 'all', :lookback_days => '1'}
    end

  end

end
