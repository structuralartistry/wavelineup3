class TravelCardsController < ApplicationController
  def edit
    @travel_card = TravelCard.find(params[:id])
  end

  def update
    @travel_card = TravelCard.find(params[:id])

    respond_to do |format|
      if @travel_card.update_attributes(params[:travel_card])
        flash[:notice] = 'Record updated'
        format.html { redirect_to(@travel_card) }
        format.js { render 'update_response' }
      else
        flash[:notice] = 'Record failed to update. Please reload the page and try again.'
        format.html { render :action => "edit" }
        format.js { render 'update_response' }
      end
    end
  end
end
