class UserSessionsController < ApplicationController

  def new
    @user_session = UserSession.new

    respond_to do |format|
      if !current_user
        format.html { render 'new', :layout => 'guest' }
      else
        format.html { redirect_to home_path }
      end
    end
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    respond_to do |format|
      if @user_session.save
        Login.create!(:email => @user_session.email, :user_id => User.find_by_email(@user_session.email).id, :success => true)
        flash[:notice] = "Welcome to WaveLineup #{@user_session.email}!"
        format.html { redirect_to(home_path) }
      else
        Login.create!(:email => @user_session.email, :success => false)
        flash[:notice] = "Authentication failed"
        format.html { render :action => "new", :layout => 'guest' }
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

  def internet_explorer
    render 'internet_explorer', :layout => 'bare'
  end
end
