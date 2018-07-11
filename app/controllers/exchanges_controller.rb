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
      if request.env["HTTP_REFERER"]
        listing_id = request.env["HTTP_REFERER"].split("/")[-1].to_i
        @listing = Listing.find(listing_id)
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
      if @exchange.save
        redirect_to user_path(@exchange.renter_id)
      else
        render :new
      end
  end

  private

  def exchange_params
    params.require(:exchange).permit(:listing_id, :renter_id, :start_date, :end_date, :total_price)
  end

end
