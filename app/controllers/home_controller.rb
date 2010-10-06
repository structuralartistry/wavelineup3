class HomeController < ApplicationController
  
  def index
    @practice_member = PracticeMember.new
    @practice_members = PracticeMember.get_all_restricted_by_user(current_user)
  end

end
