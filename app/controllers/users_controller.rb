class UsersController < ApplicationController

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.new(params[:user])
   
    respond_to do |format|
      if @user.save  
        SystemMailer.user_welcome_email(@user).deliver
        format.html { redirect_to(root_url, :notice => 'Registration successful') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update  
    @user = current_user

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(root_url, :notice => 'User profile successfully updated') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
    end
  end
end
