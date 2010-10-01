class ActivationsController < ApplicationController

  def create
    @user = User.find_using_perishable_token(params[:activation_code], 1.week)
    if @user
      if @user.active?
        flash[:notice] = "This user is already active. You have been logged in to the system."
        UserSession.create(@user, false) # Log user in manually
        @user.deliver_welcome!
        redirect_to root_url
      else
        if @user.activate!
          flash[:notice] = "Your account has been activated"
          UserSession.create(@user, false) # Log user in manually
          @user.deliver_welcome!
          redirect_to root_url
        else
          flash[:notice] = "User failed to be activated. We are sending a new activation link to #{@user.email}. If you continue to recieve this message with the new link, please contact support."
          render :partial => 'activations/reactivate', :layout => 'application', :locals => { :email => @user.email }
        end 
      end       
    else
      flash[:notice] = "User does not exist"
      redirect_to login_url
    end
  end

 end
