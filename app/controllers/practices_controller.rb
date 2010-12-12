class PracticesController < ApplicationController
  def index
    @practices = Practice.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @practice = Practice.new
    1.times { @practice.users.build }

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @practice = Practice.find(params[:id])
    @users = User.find_all_by_practice_id(params[:id])
    
    # should never get to this action if current_user is nil
    if current_user.role.name == 'sysadmin'
      render # allow all practices
    else
      if current_user.practice_id == @practice.id
        render
      else
        flash[:notice] = RESTRICTED_PAGE_NOTICE
        redirect_to home_path
      end
    end
  end

  def create
debugger
    @practice = Practice.new(params[:practice])
    @practice.users[0].role_id = Role.find_by_name('practice admin').id

    respond_to do |format|
      if @practice.save
        @practice.users[0].deliver_activation_instructions!
        format.html { redirect_to(login_path, :notice => 'Practice was successfully created. Please check your email for the activation link.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @practice = Practice.find(params[:id])

    respond_to do |format|
      if current_user.role.name == 'sysadmin' || current_user.practice.id == @practice.id
        if @practice.update_attributes(params[:practice])
          format.html { redirect_to(home_path, :notice => 'Practice was successfully updated') }
        else
          format.html { render :action => "edit" }
        end
      else
        flash[:notice] = RESTRICTED_PAGE_NOTICE
        redirect_to home_path        
      end
    end
  end

  def destroy
    @practice = Practice.find(params[:id])
    @practice.destroy
    flash[:notice] = "Practice successfully deleted"

    respond_to do |format|
      format.html { redirect_to(practices_path) }
    end
  end
end
