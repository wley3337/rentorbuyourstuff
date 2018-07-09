class Listing < ApplicationRecord
  has_many :exchanges
  has_many :renters, through: :exchanges
  belongs_to :owner, class_name: "User"

end
