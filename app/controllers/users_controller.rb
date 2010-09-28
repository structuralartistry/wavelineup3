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
    @user.practice_id = current_user.practice.id
    @user.role_id = Role.find_by_name('practice user').id
   
    respond_to do |format|
      if @user.save_without_session_maintenance 
        @user.deliver_activation_instructions!
        format.html { redirect_to(edit_practice_path(current_user.practice.id), :notice => 'User was successfully created. Please check your email for the activation link.') }
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
    

    respond_to do |format|
      if @user != current_user
        @user.destroy
        format.html { redirect_to(edit_practice_path(current_user.practice.id), :notice => "User successfully deleted") }
      else
        format.html { redirect_to(edit_practice_path(current_user.practice.id), :notice => "Can not delete the current user") }
      end
    end
  end
end
