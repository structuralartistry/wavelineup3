class PracticeRoomController < ApplicationController
  def main
    @practice_member = PracticeMember.find(params[:id])
    
    @travel_card = TravelCard.where(['practice_member_id=?', params[:id]]).first
   
    @practice_member_visit = PracticeMemberVisit.where(["practice_member_id=?", @practice_member.id]).first
    @practice_member_visit = PracticeMemberVisit.new if !@practice_member_visit
    @practice_member_visit.practice_member_id = @practice_member.id
    @practice_member_visit.save
    
    acceptable_sections = %w(visit visit_list travel_card)
    if !acceptable_sections.include?(params[:visible_section])
      flash[:notice] = 'The requested action was invalid'
      redirect_to '/home'
    end
  end

end
