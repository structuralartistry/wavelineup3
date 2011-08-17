class ActivationsController < ApplicationController

  def create
    @user = User.find_by_perishable_token(params[:activation_code])
    @user.reset_perishable_token! # for security
    if @user
      if @user.active?
        flash[:notice] = "This user is already active. You have been logged in to the system."
        session[:current_user] = @user
        @user.deliver_welcome!
        redirect_to home_path
      else
        if @user.activate!
          flash[:notice] = "Your account has been activated"
          session[:current_user] = @user
          @user.deliver_welcome!
          redirect_to home_path
        else
          flash[:notice] = "User failed to be activated. We are sending a new activation link to #{@user.email}. If you continue to recieve this message with the new link, please contact support."
          render 'activations/reactivate'
        end
      end
    else
      flash[:notice] = "User does not exist or has already been activated. Please try to log in to the system."
      redirect_to login_path
    end
  end

  def resend
    @user = User.find_by_perishable_token(params[:activation_code])
    if @user
      @user.deliver_activation_instructions!
      flash[:notice] = "The activation link has been resent to #{@user.email}"
    else
      flash[:notice] = 'The user could not be found in the system.'
    end
    redirect_to login_path
  end

 end
