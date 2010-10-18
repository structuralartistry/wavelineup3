class PracticeMembersController < ApplicationController

  def new
    @practice_member = PracticeMember.new

    respond_to do |format|
      format.js {render 'new'}
    end
  end

  def edit
    @practice_member = PracticeMember.find(params[:id])
  end

  def create
    @practice_member = PracticeMember.new(params[:practice_member])
    @practice_member.practice_id = current_user.practice_id

    respond_to do |format|
      if @practice_member.save
        travel_card_id = TravelCard.find_by_practice_member_id(@practice_member.id).id
        flash[:notice] = 'Practice Member successfully created'
        format.html { redirect_to edit_travel_card_path(travel_card_id)}
      else
        format.html { render :partial => 'new', :layout => "application" }
      end
    end
  end

  def update
    @practice_member = PracticeMember.find(params[:id])

    respond_to do |format|
      if @practice_member.update_attributes(params[:practice_member])
        flash[:notice] = 'Practice Member successfully updated'
        format.html { redirect_to home_path }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @practice_member = PracticeMember.find(params[:id])
    flash[:notice] = 'Practice Member successfully deleted' if @practice_member.destroy

    respond_to do |format|
      format.html { redirect_to home_path }
    end
  end
end
