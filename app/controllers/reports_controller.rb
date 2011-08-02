class ReportsController < ApplicationController

  def index
  end

  def show
    filter_practice_members = params[:filter_practice_members]
    lookback_days = params[:lookback_days]
    if !filter_practice_members || !lookback_days
      flash[:notice] = 'Invalid report request. Please try again.'
      redirect_to reports_path
    else
@visits = Visit.all
      render :show
    end
  end

end
