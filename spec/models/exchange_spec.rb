require 'rails_helper'



RSpec.describe Exchange, type: :model do

    describe 'exchange methods' do
        before(:each) do

            User.destroy_all
            Listing.destroy_all
            Exchange.destroy_all

            @u1 = User.create(name: "Anthony", username: "Anthony1", password: "password")
            @u2 = User.create(name: "Henry", username: "Henry1", password: "password")
            @listing = Listing.create(product_name: "Laptop", product_description: "Mac Book Pro", item_value: 2000.00, rental_price: 25.00, buy_price: 1700.00, quality: "Slow", address: "213 Street Rd.", zip_code: 20009)
            @u1.listings << @listing
            @exchange = Exchange.create(renter_id: @u2.id, listing_id: @listing.id, start_date: "1997-10-21", end_date: "1997-10-24")
            
            
            
        end

        it 'gets owners name' do

            expect(@exchange.get_owner_name).to eq(@u1.name)
        end

        it 'gets rental cost' do

            expect(@exchange.get_rental_cost). to eq(75.0)
        end

        it 'gets renters name' do

            expect(@exchange.get_renter_name).to eq(@u2.name)
        end

        it 'should format the start date' do

            expect(@exchange.start_date_format).to eq("Tue, October 21, 1997")
        end

        it 'should format the end date' do

            expect(@exchange.end_date_format).to eq("Fri, October 24, 1997")
        end
    end
end

# RSpec.describe User, type: :model do
#     it 'has a password field' do
#       expect(User.new).to respond_to(:password)
#     end
  
#     it 'has a name field' do
#       expect(User.new).to respond_to(:name)
#     end
  
#     it 'has a password confirmation field' do
#       expect(User.new).to respond_to(:password_confirmation)
#     end
  
#     it 'is valid if password and password_confirmation match' do
#       user = User.new
#       user.password = user.password_confirmation = 'foo'
#       expect(user.valid?).to be true    
#     end
  
#     it 'is valid if password is set and password_confirmation is nil' do
#        user = User.new
#        user.password = 'foo'
#        expect(user.valid?).to be true 
#     end
  
#     it "is invalid if password and password_confirmation are both non-nil and don't match" do
#       user = User.new
#       user.password = 'foo'
#       user.password_confirmation = 'fo0'
#       expect(user.valid?).to be false
#     end
  
#     describe 'authenticate' do
#       it 'returns the user if credentials match' do
#         user = User.new
#         user.password = 'foo'
#         expect(user.authenticate('foo')).to eq(user)
#       end
  
#       it "returns falsey if credentials don't match" do
#         user = User.new
#         user.password = 'foo'
#         expect(user.authenticate('fo0')).to be_falsey 
#       end
#     end
#   end




