class FeedbackSupportsController < ApplicationController

  def create
    @feedback_support = FeedbackSupport.new(params[:feedback_support])
    @feedback_support.user_id = current_user.id
    @feedback_support.location_in_application = request.fullpath

    respond_to do |format|
      if @feedback_support.save
        flash[:notice] = 'Thanks for your message. We will respond promptly!'
        @feedback_support = FeedbackSupport.new
      end
      format.js { render 'response' }
    end
  end
  
end
