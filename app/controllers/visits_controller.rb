class VisitsController < ApplicationController
  
  def update
    @visit = Visit.find(params[:id])

    respond_to do |format|
      if @visit.update_attributes(params[:visit])
        format.js { render 'update_response' }
      else
        format.js { render 'update_response' }
      end
    end
  end
  
end
