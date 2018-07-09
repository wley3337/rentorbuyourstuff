class CreateExchanges < ActiveRecord::Migration[5.2]
  def change
    create_table :exchanges do |t|
      t.integer :renter_id
      t.integer :listing_id
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
