class ReportsController < ApplicationController

  def index
  end

  def show
    # verify params are present
    filter_practice_members = params[:filter_practice_members]
    @lookback_days = params[:lookback_days]
    if !filter_practice_members || !@lookback_days
      flash[:notice] = 'Invalid report request. Please try again.'
      redirect_to reports_path
    else
      if filter_practice_members == 'all'
        @visits = Visit.joins(:practice_member => :practice).where('practice_members.practice_id=? AND visits.date>=?', current_user.practice_id, Time.zone.now-@lookback_days.to_i.days).order('practice_members.last_name, practice_members.first_name, visits.date DESC')
        @filtered_practice_member_name = 'all'
      else
        filtered_practice_member = PracticeMember.get_by_id_restricted_by_user(filter_practice_members, current_user)
        @filtered_practice_member_name = filtered_practice_member.full_name_last_comma_first_middle_initial.upcase if filtered_practice_member
        @visits = Visit.joins(:practice_member => :practice).where('practice_members.practice_id=? AND visits.practice_member_id=? AND visits.date>=?', current_user.practice_id, filter_practice_members, Time.zone.now-@lookback_days.to_i.days).order('practice_members.last_name, practice_members.first_name, visits.date DESC')
      end

      render :show
    end
  end

end
