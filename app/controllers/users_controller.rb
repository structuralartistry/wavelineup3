class UsersController < ApplicationController

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
        format.html { redirect_to(edit_practice_path(current_user.practice.id), :notice => "User was successfully created. Please check email for #{@user.email} for the activation link.") }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @user = current_user

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User profile successfully updated'
        format.html { redirect_to(home_path) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @user = User.get_by_id_restricted_by_user_role_and_practice(params[:id], current_user)    

    respond_to do |format|
      if @user != current_user
        @user.destroy
        flash[:notice] = "User successfully deleted"
        if current_user.role.name == 'sysadmin'
          format.html { redirect_to(home_path) }
        else
          format.html { redirect_to(edit_practice_path(current_user.practice.id)) }
        end
      else
        flash[:notice] = "Can not delete the current user"
        format.html { redirect_to(edit_practice_path(current_user.practice.id)) }
      end
    end
  end
end
