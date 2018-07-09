class ListingsController < ApplicationController
  before_action :find_listing, only:[:show, :edit, :update, :destroy]

  def index
    @listings = Listing.all
  end

  def show
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(list_params)
    if @listing.save
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @listing.update(list_params)
      redirect_to listing_path(@listing)
    else
      render :edit 
    end
  end

  def destroy
    #don't forget to manage all dependants like exchanges
  end



  private

    def list_params
      params.require(:listing).permit(:product_name, :product_description, :item_value, :rental_price, :buy_price, :quality, :address, :zip_code, :owner_id)
    end

    def find_listing
      @listing = Listing.find(params[:id])
    end

end
