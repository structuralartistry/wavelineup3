class InvitationsController < ApplicationController
  
  def create
    @invitation = Invitation.new(params[:invitation])
    @invitation.referring_user_id = current_user.id

    respond_to do |format|
      if @invitation.save
        SystemMailer.wavelineup_invitation(@invitation).deliver
        flash[:notice] = "An invite has been sent to #{@invitation.email}"
        @invitation = Invitation.new # create new one, as we are returning now a new invite form to the page in js
      end
      format.js { render 'response' }
    end
  end

end
