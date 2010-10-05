class PracticeMembersController < ApplicationController
  def index
    @practice_members = PracticeMember.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @practice_member = PracticeMember.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @practice_member = PracticeMember.find(params[:id])
  end

  def create
    @practice_member = PracticeMember.new(params[:practice_member])

    respond_to do |format|
      if @practice_member.save
        flash[:notice] = 'Practice Member successfully created'
        format.html { edit_practice_path(current_user.practice_id) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @practice_member = PracticeMember.find(params[:id])

    respond_to do |format|
      if @practice_member.update_attributes(params[:practice_member])
        flash[:notice] = 'Practice Member successfully updated'
        format.html { edit_practice_path(current_user.practice_id) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @practice_member = PracticeMember.find(params[:id])
    flash[:notice] = 'Practice Member successfully deleted' if @practice_member.destroy

    respond_to do |format|
      format.html { redirect_to(edit_practice_path(current_user.practice_id)) }
    end
  end
end
