require 'rails_helper'



  describe 'create listing' do

    before(:each) do
        User.destroy_all
        Listing.destroy_all

      @u1 = User.create(name: "Essa", username: "e1", password: "essa123")

      @u2 = User.create(name: "Anthony", username: "a1", password: "anthony123")
      @l1 = Listing.create(product_name: "Bike", product_description: "bicycle", item_value: 1000.00, rental_price: 30.00, buy_price: 800.00, quality: "Mint Condition", address: "123 Street Rd.", zip_code: 20009)

      @u1.listings << @l1
    end

    it "can create listing with-out buy price" do
      visit "/"
      fill_in "username", with: "e1"
      fill_in "password", with: "essa123"
      click_on "Log In"
      click_on "Create A New Listing"
      fill_in "Product name", with: "Guitar"
      fill_in "Product description", with: "Guitar fdescribe"
      fill_in "Item value", with: "3"
      fill_in "Rental price", with: "3"
      fill_in "Quality", with: "Good"
      fill_in "Address", with: "123 street"
      fill_in "Zip code", with: "20009"
      click_on "Submit Listing"
      expect(page.body).to include "Guitar fdescribe"
    end

    it 'redirects to index page if path is not found' do

      visit '/randompath'

      expect(page.body).to include "Path not found"
    end

end
