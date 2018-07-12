class ListingsController < ApplicationController
  before_action :find_listing, only:[:show, :edit, :update, :destroy]

  def index
    @existinglistings = Listing.existing_listings
  end

  def show
  end

  def new
    if current_user
    @listing = Listing.new
    else
      flash[:notice] = "You must be logged in to create a listing"
      redirect_to root_path
    end
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
    if current_user != nil
      #--redirects if owner is not user
      redirect_to listing_path(@listing)  unless @listing.owner_id == current_user.id
    else
      flash[:notice] = "You must be logged in to edit a listing"
      redirect_to root_path
    end
  end

  def update
    if @listing.update(list_params)
      redirect_to listing_path(@listing)
    else
      render :edit
    end
  end

  def destroy
    #--keep acutal database record for analitics
    @listing.deleted = true
    @listing.save
    redirect_to user_path(current_user)
  end

  private

    def list_params
      params.require(:listing).permit(:product_name, :product_description, :item_value, :rental_price, :buy_price, :quality, :address, :zip_code, :owner_id, :deleted)
    end

    def find_listing
      @listing = Listing.find(params[:id])
    end

end
