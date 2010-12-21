class HomeController < ApplicationController
  
  def index
    @practice_members = PracticeMember.get_all_restricted_by_user(current_user)
    @invitation = Invitation.new
  end

end
