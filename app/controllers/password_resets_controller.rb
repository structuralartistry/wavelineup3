class PasswordResetsController < ApplicationController
  before_filter :load_user_using_perishable_token, :only => [:edit, :update]

  def new
    @user = User.new
    render 'new', :layout => 'guest'
  end

  def create
    @user = User.find_by_email(params[:user][:email])

    if @user
      @user.deliver_password_reset_instructions!
      flash[:notice] = "Instructions to reset your password have been emailed to you. Please check your email."
      redirect_to login_path
    else
      @user = User.new
      flash[:notice] = "No user was found with that email address"
      render 'new', :layout => 'guest'
    end
  end

  def edit
    render
  end

  def update
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      flash[:notice] = "Password successfully updated"
      redirect_to home_path
    else
      render :action => :edit
    end
  end

  private
  def load_user_using_perishable_token
    @user = User.find_by_perishable_token(params[:id])
    unless @user
      flash[:notice] = <<-EOF
        We're sorry, but we could not locate your account.
        Please click on the 'Forgot Password?' button again to restart the process.
        Also, make sure that you are copying the full URL from the email you receive.
      EOF
      redirect_to login_path
    end
  end

end
