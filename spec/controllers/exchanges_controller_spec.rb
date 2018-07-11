require 'rails_helper'

RSpec.describe ExchangesController, type: :controller do

  let(:exchange_fail) {{renter_id: 1, listing_id: 2, start_date: 10-21-1997, end_date: 10-24-1996}}

  let(:exchange_test_2) {{renter_id: 2, listing_id: 3, start_date: 10-21-2023, end_date: 10-24-2023}}


  describe 'create exchange' do

    it 'can not create exchange with end_date < start_date'do
     post :create, :exchange =>  {renter_id: 1, listing_id: 2, start_date: 10-21-1997, end_date: 10-24-1996}
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
