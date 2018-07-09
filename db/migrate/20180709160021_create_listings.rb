class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :product_name
      t.string :product_description
      t.float :item_value
      t.float :rental_price
      t.float :buy_price
      t.string :quality
      t.string :address
      t.integer :zip_code
      t.integer :owner_id

      t.timestamps
    end
  end
end
