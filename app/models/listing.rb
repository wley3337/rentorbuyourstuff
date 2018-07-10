class Listing < ApplicationRecord
  has_many :exchanges
  has_many :renters, through: :exchanges
  belongs_to :owner, class_name: "User"

  validates :product_name, presence: true, uniqueness: { scope: :owner_id }
  validates_presence_of :quality, :owner_id, :address, :product_description
  validates_presence_of :item_value, :rental_price, :zip_code, numericality: true
  validates :buy_price, numericality: true, allow_blank: true




end
