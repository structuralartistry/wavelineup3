class ReportsController < ApplicationController

  def index
  end

  def show
    filter_practice_member = params[:filter_practice_member]

    # set lookback days -- if '0' then is 'today'
    lookback_days = params[:lookback_days]
    if lookback_days == '0'
      @start_date = Time.zone.now.beginning_of_day
    else
      @start_date = Time.zone.now-lookback_days.to_i.days
    end

    if !filter_practice_member || !@start_date
      flash[:notice] = 'Invalid report request. Please try again.'
      redirect_to reports_path
    else
      if filter_practice_member == 'all'
        @visits = Visit.joins(:practice_member => :practice).where('practice_members.practice_id=? AND visits.date>=?', current_user.practice_id, @start_date).order('practice_members.last_name, practice_members.first_name, visits.date DESC')
        @filtered_practice_member_name = 'all'
      else
        filtered_practice_member = PracticeMember.get_by_id_restricted_by_user(filter_practice_member, current_user)
        @filtered_practice_member_name = filtered_practice_member.full_name.upcase if filtered_practice_member
        @visits = Visit.joins(:practice_member => :practice).where('practice_members.practice_id=? AND visits.practice_member_id=? AND visits.date>=?', current_user.practice_id, filter_practice_member, @start_date).order('practice_members.last_name, practice_members.first_name, visits.date DESC')
      end

      render :show
    end
  end

end
