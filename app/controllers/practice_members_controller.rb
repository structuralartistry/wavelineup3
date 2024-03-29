class PracticeMembersController < ApplicationController

  def edit
    @practice_member = PracticeMember.get_by_id_restricted_by_user(params[:id], current_user)
  end

  def create
    @practice_member = PracticeMember.new(params[:practice_member])
    @practice_member.practice_id = current_user.practice_id

    respond_to do |format|
      if @practice_member.save
        @travel_card = TravelCard.find_by_practice_member_id(@practice_member.id)
        flash[:notice] = 'Practice Member successfully created'
        format.js { render 'success' }
      else
        format.js { render 'new' }
      end
    end
  end

  def update
    @practice_member = PracticeMember.get_by_id_restricted_by_user(params[:id], current_user)

    respond_to do |format|
      if @practice_member && @practice_member.update_attributes(params[:practice_member])
        flash[:notice] = 'Practice Member successfully updated'
        format.html { redirect_to home_path }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @practice_member = PracticeMember.get_by_id_restricted_by_user(params[:id], current_user)
    if @practice_member && @practice_member.destroy
      flash[:notice] = 'Practice Member successfully deleted'
    end

    respond_to do |format|
      format.html { redirect_to home_path }
    end
  end
end
