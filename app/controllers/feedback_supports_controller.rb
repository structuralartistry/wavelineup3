class FeedbackSupportsController < ApplicationController

  def create
    @feedback_support = FeedbackSupport.new(params[:feedback_support])
    @feedback_support.user_id = current_user.id
    @feedback_support.location_in_application = request.fullpath

    respond_to do |format|
      if @feedback_support.save
        format.html { redirect_to(@feedback_support, :notice => 'Feedback support was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
end
