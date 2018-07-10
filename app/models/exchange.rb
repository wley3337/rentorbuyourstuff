class Exchange < ApplicationRecord
  belongs_to :renter, class_name: "User"
  belongs_to :listing

  def start_date_format
    self.start_date.strftime("%a, %B %e, %Y")
  end

  def end_date_format
    self.end_date.strftime("%a, %B %e, %Y")
  end


  def get_owner_name
    id = self.listing.owner_id
    owner = User.find(id)
    owner.name
  end


  def get_renter_name
    id = self.renter_id
    renter = User.find(id)
    renter.name
  end


  def get_duration
    ((self.end_date).to_date - (self.start_date).to_date).to_i
  end


  def get_rental_cost
    listing = Listing.find(self.listing_id)
    rental_per_day = listing.rental_price

    rental_cost = rental_per_day * self.get_duration.to_f
    # number_to_currency(rental_cost)
  end


end
