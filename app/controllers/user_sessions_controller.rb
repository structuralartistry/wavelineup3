class UserSessionsController < ApplicationController

  def new
    @user_session = UserSession.new

    respond_to do |format|
      if !current_user
        format.html # new.html.erb
      else
        format.html { redirect_to home_path }
      end
    end
  end

  def create
    @user_session = UserSession.new(params[:user_session])

    respond_to do |format|
      if @user_session.save
        flash[:notice] = "Welcome to WaveLineup #{@user_session.email}!"
        format.html { redirect_to(home_path) }
      else       
        flash[:notice] = "Authentication failed"
        format.html { render :action => "new" }
      end
    end
  end

  def destroy
    @user_session = UserSession.find(params[:id])
    @user_session.destroy if @user_session

    respond_to do |format|
      flash[:notice] = "Successfully logged out"
      format.html { redirect_to(login_path) }
    end
  end
end
