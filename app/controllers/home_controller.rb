class HomeController < ApplicationController
  
  def index
    @practice_members = PracticeMember.get_all_restricted_by_user(current_user)
    @invitation = Invitation.new
  end
  
  def terms_of_service
    render 'terms_of_service', :layout => 'bare'
  end
  
  def privacy_policy
    render 'privacy_policy', :layout => 'bare'
  end

end
