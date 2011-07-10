class VisitsController < ApplicationController

  def update
    @visit = Visit.get_by_id_restricted_by_user(params[:id], current_user)

    respond_to do |format|
      if @visit && @visit.update_attributes(params[:visit])
        format.js { render 'update_response' }
      else
        # entrainment date is the only validation we send back a specific error for
        if params[:visit][:date]
          flash[:notice] = 'Date invalid: Please correct'
        else
          flash[:notice] = 'Data error'
        end
        format.js { render 'update_response' }
      end
    end
  end

  def destroy
    @visit = Visit.get_by_id_restricted_by_user(params[:id], current_user)

    if @visit
      practice_member_id = @visit.practice_member.id
      if @visit.destroy
        flash[:notice] = "Visit successfully deleted"
        redirect_to "/practice_room/#{practice_member_id}/visit" and return
      end
    end

    flash[:notice] = "Visit was not deleted"
    redirect_to request.fullpath
  end

end
