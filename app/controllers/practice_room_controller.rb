class PracticeRoomController < ApplicationController
  def main
    @practice_member = PracticeMember.find(params[:id])
    
    @travel_card = TravelCard.where(['practice_member_id=?', params[:id]]).first
    
    case params[:visible_section]
    when 'travel_card'
      a = 1
    when 'visit'
      a = 1
    when 'visit_list'
      a = 1
    else
      flash[:notice] = 'The requested action was invalid'
      redirect_to '/home'
    end
  end

end
