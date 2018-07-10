class ExchangesController < ApplicationController

  def show
    @exchange = Exchange.find(params[:id ])

    @renter = User.find(@exchange.renter_id)

    @listing = Listing.find(@exchange.listing_id)
    @owner = User.find(@listing.owner_id)
  end

  
end
