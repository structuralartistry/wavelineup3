class PracticeMemberVisitsController < ApplicationController
  
  def update
    @practice_member_visit = PracticeMemberVisit.find(params[:id])
debugger
    respond_to do |format|
      if @practice_member_visit.update_attributes(params[:practice_member_visit])
        format.js { render 'update_response' }
      else
        format.js { render 'update_response' }
      end
    end
  end
  
end
