class TravelCardsController < ApplicationController

  def update
    @travel_card = TravelCard.get_by_id_restricted_by_user(params[:id], current_user)

    respond_to do |format|
      if @travel_card && @travel_card.update_attributes(params[:travel_card])
        format.html { redirect_to(@travel_card) }
        format.js { render 'update_response' }
      else
        format.html { redirect_to(home_path) }
        format.js { render nothing }
      end
    end
  end

end
