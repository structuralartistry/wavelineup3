class TravelCardsController < ApplicationController
  def edit
    @travel_card = TravelCard.find(params[:id])
  end

  def update
    @travel_card = TravelCard.find(params[:id])

    respond_to do |format|
      if @travel_card.update_attributes(params[:travel_card])
        format.html { redirect_to(@travel_card, :notice => 'Travel card was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end
end
