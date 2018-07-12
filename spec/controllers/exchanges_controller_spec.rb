require 'rails_helper'

RSpec.describe ExchangesController, type: :controller do



  describe 'create exchange' do
      before(:each) do
        u1 = User.create(name: "Essa", username: "e1", password: "essa123")
        u2 = User.create(name: "Anthony", username: "a1", password: "anthony123")
        l1 = Listing.create(product_name: "Bike", product_description: "bicycle", item_value: 1000.00, rental_price: 30.00, buy_price: 800.00, quality: "Mint Condition", address: "123 Street Rd.", zip_code: 20009)
        u1.listings << l1
      end


      it 'can not create exchange with end_date < start_date'do
       post :create, params: { exchange: {renter_id: 2, listing_id: 1, start_date: "2023-10-24", end_date: "2022-10-25", total_price: 10.00} }
        expect(response).to render_template(:new)
      end
    end
end
#




# RSpec.describe UsersController, type: :controller do
#
#   let(:steven) {{name: 'Steven',
#             password: 'un1verse',
#             password_confirmation: 'un1verse'}}
#
#   describe 'create' do
#     it "creates a new user" do
#       post :create, user: steven
#       expect(User.last.name).to eq('Steven')
#     end
#
#     it "logs you in" do
#       post :create, user: steven
#       expect(session[:user_id]).to eq(User.last.id)
#     end
#
#     it "sets your password if the confirmation matches" do
#       post :create, user: steven
#       expect(User.last.authenticate(steven[:password])).to eq(User.last)
#     end
#
#     it "redirects you if your password and confirmation don't match" do
#       typo = steven.merge(password_confirmation: 'uni111verse')
#       post :create, user: typo
#       expect(response).to redirect_to(controller: 'users', action: 'new')
#     end
#   end
# end
