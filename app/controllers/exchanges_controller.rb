class ExchangesController < ApplicationController

  def show
    if current_user != nil
      @exchange = Exchange.find(params[:id ])
      @renter = User.find(@exchange.renter_id)
      @listing = Listing.find(@exchange.listing_id)
      @owner = User.find(@listing.owner_id)
      if @owner.id != current_user.id && @renter.id != current_user.id
        flash[:notice] = "You can only view Exchanges that you are part of"
        redirect_to user_path(current_user)
      end
    else
      flash[:notice] = "Please log in to see your Exchanges"
      redirect_to root_path
    end
  end

  def new
    if current_user != nil
      if params[:listing_id]
        @listing = Listing.find(params[:listing_id])
          if @listing.owner_id == current_user.id
            flash[:notice] = "You can not rent your own item"
            redirect_to user_path(current_user)
          else
            @exchange = Exchange.new
          end
      else
        flash[:notice] = "Please visit a listing page to create an Exchange"
        redirect_to user_path(current_user)
      end
    else
      flash[:notice] = "Please log in to create an Exchange"
      redirect_to root_path
    end
  end

  def create
    @exchange = Exchange.new(exchange_params)
    @exchange.total_price = @exchange.get_rental_cost
    @listing = Listing.find(@exchange.listing_id)
    if @listing.date_conflict?(@exchange.start_date, @exchange.end_date) && @exchange.valid?
        @exchange.errors.add(:date_conflict, ": Rental times conflict with other exchanges")
        render :new
    else
      if @exchange.save
        redirect_to user_path(@exchange.renter_id)
      else
        render :new
      end
    end
  end

  private

  def exchange_params
    params.require(:exchange).permit(:listing_id, :renter_id, :start_date, :end_date, :total_price)
  end

end
