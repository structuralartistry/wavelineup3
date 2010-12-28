class PracticeMemberVisitsController < ApplicationController
  
  def update
    @practice_member_visit = PracticeMemberVisit.find(params[:id])

    respond_to do |format|
      if @practice_member_visit.update_attributes(params[:practice_member_visit])
        format.html { redirect_to(@practice_member_visit) }
        format.js { render 'update_response' }
      else
        format.html { render :action => "edit" }
        format.js { render 'update_response' }
      end
    end
  end
  
end
