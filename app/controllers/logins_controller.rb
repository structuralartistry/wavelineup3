class LoginsController < ApplicationController

  def new
    if !current_user
      render 'new', :layout => 'guest'
    else
      redirect_to home_path
    end
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.active && @user.authenticate(@user.email, params[:password])
      session[:current_user] = @user
      Login.create!(:email => @user.email, :user_id => @user.id, :success => true)
      flash[:notice] = "Welcome to WaveLineup #{@user.email}!"
      redirect_to(home_path)
    else
      Login.create!(:email => params[:email], :success => false)
      session[:current_user] = nil
      flash[:notice] = "Authentication failed"
      render :action => "new", :layout => 'guest'
    end
  end

  def destroy
    session[:current_user] = nil
    flash[:notice] = "Successfully logged out"
    redirect_to(login_path)
  end

  def internet_explorer
    render 'internet_explorer', :layout => 'bare'
  end
end
