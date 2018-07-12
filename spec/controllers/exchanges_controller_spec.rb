require 'rails_helper'

RSpec.describe ExchangesController, type: :controller do

  describe 'create exchange' do
    before(:each) do
        User.destroy_all
        Listing.destroy_all

      @u1 = User.create(name: "Essa", username: "e1", password: "essa123", id: 1)

      @u2 = User.create(name: "Anthony", username: "a1", password: "anthony123", id: 2)
      @l1 = Listing.create(id: 1, product_name: "Bike", product_description: "bicycle", item_value: 1000.00, rental_price: 30.00, buy_price: 800.00, quality: "Mint Condition", address: "123 Street Rd.", zip_code: 20009)

      @u1.listings << @l1
    end


    it 'can not create exchange with end_date < start_date'do
     post :create, params: { exchange: {renter_id: @u2.id, listing_id: @l1.id, start_date: "2023-10-24", end_date: "2022-10-25", total_price: 10.00} }
      expect(response).to render_template(:new)
    end
  end


end
