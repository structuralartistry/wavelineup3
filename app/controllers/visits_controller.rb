class VisitsController < ApplicationController
  
  def update
    @visit = Visit.find(params[:id])
    
    respond_to do |format|
      if @visit.update_attributes(params[:visit])
        format.js { render 'update_response' }
      else
        # entrainment date is the only validation we send back a specific error for
        if params[:visit][:entrainment_date]
          flash[:notice] = 'Date invalid: Please correct'
        else
          flash[:notice] = 'Data error'
        end
        format.js { render 'update_response' }
      end
    end
  end
  
end
