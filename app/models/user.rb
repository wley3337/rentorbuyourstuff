class User < ApplicationRecord
  has_many :listings, foreign_key: "owner_id"
  has_many :exchanges, through: :listings, foreign_key: "owner_id"
  has_many :exchanges, foreign_key: "renter_id"
  has_secure_password
  validates :username, presence: true, uniqueness: { case_sensitive: false}

  def deactivated_listings
    self.listings.select do |listing|
      listing.deleted == true
    end
  end

  def active_listings
    self.listings.select do |listing|
      listing.deleted == false
    end
  end
end
