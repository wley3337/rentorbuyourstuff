class User < ApplicationRecord
  has_many :listings, foreign_key: "owner_id"
  has_many :exchanges, through: :listings, foreign_key: "owner_id"
  has_many :exchanges, foreign_key: "renter_id"
  has_secure_password
  validates :username, presence: true, uniqueness: { case_sensitive: false}

  
end
