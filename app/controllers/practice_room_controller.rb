class PracticeRoomController < ApplicationController
  def main
    @practice_member = PracticeMember.where(['id=? AND practice_id=?', params[:id], current_user.practice.id]).first
    
    @travel_card = TravelCard.where(['practice_member_id=?', @practice_member.id]).first
      
    if params[:visit_id]
      if params[:visit_id] == 'new'
        @visit = Visit.new
        @visit.entrainment_date = Date.today
        @visit.practice_member_id = @practice_member.id
        @visit.save
        
        redirect_to "/practice_room/#{@practice_member.id}/visit/#{@visit.id}"
      else
        @visit = Visit.where(['id=? AND practice_member_id=?', params[:visit_id], @practice_member.id]).first
      end
    else
      @visit = Visit.where(['practice_member_id=? AND entrainment_date>?', @practice_member.id, Date.today-1]).order('entrainment_date DESC').first
      redirect_to "/practice_room/#{@practice_member.id}/visit/#{@visit.id}" if @visit
    end
    
    # @visit = nil if @visit==[]

    # see if there is already a visit existing in the last 24 hours load it
    

    
    @visit_list = Visit.where(['practice_member_id=?', @practice_member.id]).order('entrainment_date DESC').all
    
    acceptable_sections = %w(visit visit_list travel_card)
    if !acceptable_sections.include?(params[:visible_section])
      flash[:notice] = 'The requested action was invalid'
      redirect_to '/home'
    end
  end

end
