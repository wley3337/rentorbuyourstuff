class Listing < ApplicationRecord
  has_many :exchanges
  has_many :renters, through: :exchanges
  belongs_to :owner, class_name: "User"

  validates :product_name, presence: true, uniqueness: { scope: :owner_id }
  validates_presence_of :quality, :owner_id, :address, :product_description
  validates_presence_of :item_value, :rental_price, :zip_code, numericality: true
  validates :buy_price, numericality: true, allow_blank: true

#-----------helper methods for date conflicts and displaying only future exchanges-----------
  def future_exchanges
    self.exchanges.select { |exchange| exchange.start_date > Time.now }
  end

  def date_conflict?(st_date, e_date)
    self.exchanges.each do |exchange|
      if !(st_date < exchange.start_date && e_date < exchange.start_date || exchange.end_date < st_date)
        return true
      end
    end
    false
  end


  

end
