class AddTotalPriceToExchanges < ActiveRecord::Migration[5.2]
  def change
    add_column :exchanges, :total_price, :float
  end
end
