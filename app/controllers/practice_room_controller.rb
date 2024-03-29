class PracticeRoomController < ApplicationController
  def main
    @practice_member = PracticeMember.get_by_id_restricted_by_user(params[:id], current_user)
    if @practice_member
      @practice_member.last_practice_room_access = DateTime.now
      @practice_member.save

      @travel_card = @practice_member.travel_card

      if params[:visit_id]
        if params[:visit_id] == 'new'
          @visit = Visit.new
          @visit.date = Time.zone.now
          @visit.practice_member_id = @practice_member.id
          @visit.save
          redirect_to "/practice_room/#{@practice_member.id}/visit/#{@visit.id}"
        else
          @visit = Visit.where(['id=? AND practice_member_id=?', params[:visit_id], @practice_member.id]).first
        end
      else
        @visit = Visit.where(['practice_member_id=? AND date>?', @practice_member.id, Time.zone.now-3.hours]).order('date DESC').first
        redirect_to "/practice_room/#{@practice_member.id}/visit/#{@visit.id}" if @visit
      end

      @visit_list = Visit.where(['practice_member_id=?', @practice_member.id]).order('date DESC').page(nil).per(7)

      acceptable_sections = %w(visit visit_list travel_card)
      if !acceptable_sections.include?(params[:visible_section])
        flash[:notice] = 'The requested action was invalid'
        redirect_to '/home'
      end

    else
      flash[:notice] = 'The requested action was invalid'
      redirect_to '/home'
    end
  end

end
