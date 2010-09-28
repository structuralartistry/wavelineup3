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
  end

  def create
    @practice = Practice.new(params[:practice])
    @practice.users[0].role_id = Role.find_by_name('practice admin').id

    respond_to do |format|
      if @practice.save
        format.html { redirect_to(login_url, :notice => 'Practice was successfully created. Please check your email for the activation link.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @practice = Practice.find(params[:id])

    respond_to do |format|
      if @practice.update_attributes(params[:practice])
        format.html { redirect_to(root_url, :notice => 'Practice was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @practice = Practice.find(params[:id])
    @practice.destroy

    respond_to do |format|
      format.html { redirect_to(practices_url) }
    end
  end
end
