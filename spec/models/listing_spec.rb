require 'rails_helper'


RSpec.describe Listing, type: :model do

    describe 'listing methods' do
        before(:each) do

            User.destroy_all
            Listing.destroy_all
            Exchange.destroy_all

            @u1 = User.create(name: "Anthony", username: "Anthony1", password: "password")
            @u2 = User.create(name: "Henry", username: "Henry1", password: "password")

            @listing = Listing.create(product_name: "Laptop", product_description: "Mac Book Pro", item_value: 2000.00, rental_price: 25.00, buy_price: 1700.00, quality: "Slow", address: "213 Street Rd.", zip_code: 20009)
            @u1.listings << @listing

            @exchange = Exchange.new(renter_id: @u2.id, listing_id: @listing.id, start_date: "2018-10-21", end_date: "2018-10-24")
            @exchange.total_price = @exchange.get_rental_cost
            @exchange.save

            @exchange1 = Exchange.new(renter_id: @u2.id, listing_id: @listing.id, start_date: "2019-10-21", end_date: "2019-10-24")
            @exchange1.total_price = @exchange1.get_rental_cost
            @exchange1.save

            @exchange2 = Exchange.new(renter_id: @u2.id, listing_id: @listing.id, start_date: "2020-10-21", end_date: "2020-10-24")
            @exchange2.total_price = @exchange2.get_rental_cost
            @exchange2.save


        end

       it 'should return true if dates confilct' do

            expect(@listing.date_conflict?("2018-10-23", "2018-10-26")).to eq(true)
       end

       it 'should only return exchanges that are in the future' do

         @custom_time = Time.new(2018, 12, 21)
         allow(Time).to receive(:now).and_return(@custom_time)
         expect(@listing.future_exchanges.count).to eq(2)
       end
    end
end
