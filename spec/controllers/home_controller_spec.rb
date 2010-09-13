require 'spec_helper'

describe HomeController do
  render_views

  describe "GET index" do
    it "shows Hello World welcome message" do
      get :index
      response.should have_selector('h1', :content => 'Hello World')
    end
  end

end
