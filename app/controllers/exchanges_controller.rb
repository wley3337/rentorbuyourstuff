class ExchangesController < ApplicationController

  def show
    #--confirms user is logged in-----
    if current_user != nil  
    # instead of repeating this check, it might be easier to make a 
    # before action where you redirect if not logged in
      @exchange = Exchange.find(params[:id ])
      @renter = User.find(@exchange.renter_id)
      @listing = Listing.find(@exchange.listing_id)
      @owner = User.find(@listing.owner_id)
      #---confirms that user is either renter or owner of the product -------
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
    #--confirms user is logged in-----
    if current_user != nil
      #--confirms user is coming from a listing show page *required for
       #-listing id
      if params[:listing_id]
        @listing = Listing.find(params[:listing_id])
          #---confirms that user is not the owner of listing -------
          if @listing.owner_id == current_user.id
            flash[:notice] = "You can not rent your own item"
            redirect_to user_path(current_user)
          else
            @exchange = Exchange.new
          end
      else  # I'm not sure how this would happen if user went to a real URL
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
    #--Confirms that dates do not conflict
    # this logic might be better in the model as a validation function
    if @listing.date_conflict?(@exchange.start_date, @exchange.end_date)
        @exchange.errors.add(:date_conflict, ": Rental times conflict with other exchanges")
        render :new
    elsif @exchange.save
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
