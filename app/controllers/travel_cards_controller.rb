class TravelCardsController < ApplicationController

  def update
    @travel_card = TravelCard.find(params[:id])

    respond_to do |format|
      if @travel_card.update_attributes(params[:travel_card])
        format.html { redirect_to(@travel_card) }
        format.js { render 'update_response' }
      else
        format.html { render :action => "edit" }
        format.js { render 'update_response' }
      end
    end
  end
  
end
