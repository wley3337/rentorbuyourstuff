class User < ApplicationRecord
  has_many :listings, foreign_key: "owner_id"
  has_many :exchanges, through: :listings, foreign_key: "owner_id"
  has_many :exchanges, foreign_key: "renter_id"
  #we write a custom method to get renter info by forcing the key asssociation 
end
