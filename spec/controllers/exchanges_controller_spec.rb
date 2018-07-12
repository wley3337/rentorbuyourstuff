require 'rails_helper'

RSpec.describe ExchangesController, type: :controller do

  describe 'create exchange' do
    before(:each) do


      @u1 = User.create(name: "Essa", username: "e1", password: "essa123")
      @u2 = User.create(name: "Anthony", username: "a1", password: "anthony123")
      @u3 = User.create(name: "Will", username: "w1", password: "will123")

      @l1 = Listing.create(product_name: "Bike", product_description: "bicycle", item_value: 1000.00, rental_price: 30.00, buy_price: 800.00, quality: "Mint Condition", address: "123 Street Rd.", zip_code: 20009)
      @u1.listings << @l1

      @e1 = Exchange.create(renter_id: @u2.id, listing_id: @l1.id, start_date: "2023-10-24", end_date: "2024-10-25", total_price: 10.00)
    end


    it 'can not create exchange with end_date < start_date'do
     post :create, params: { exchange: {renter_id: @u2.id, listing_id: @l1.id, start_date: "2023-10-24", end_date: "2022-10-25", total_price: 10.00} }
      expect(response).to render_template(:new)
    end

    it 'user cannot rent own item' do
      post :new, params: { listing_id: @l1.id}, session: {user_id: @u1.id}
        expect(response).to redirect_to(user_path(@u1))
    end

    it 'user cannot view exchange if not part of it' do
<<<<<<< HEAD
      get :show, params: { exchange: {renter_id: @u2.id, listing_id: @l1.id, start_date: "2023-10-24", end_date: "2024-10-25", total_price: 10.00}}, session: {user_id: @u3.id}
=======
      get :show, params: { id: @e1.id }, session: {user_id: @u3.id}
>>>>>>> a43c0da00f205d189e02d7742369cd25ea32d140
      expect(response).to redirect_to(user_path(@u3))
    end


  end
end
