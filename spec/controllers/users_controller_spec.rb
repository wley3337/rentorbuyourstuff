require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe 'create' do
      it "creates a new user" do
        post :create, params: { user: {name: 'Anthony',
            username: 'Anthony1',
            password: '12345',
            password_confirmation: '12345'}}
        expect(User.last.name).to eq('Anthony')
      end
    end
end



# RSpec.describe UsersController, type: :controller do

#     let(:steven) {{name: 'Steven',
#               password: 'un1verse',
#               password_confirmation: 'un1verse'}}
  
#     describe 'create' do
#       it "creates a new user" do
#         post :create, user: steven
#         expect(User.last.name).to eq('Steven')
#       end
  
#       it "logs you in" do
#         post :create, user: steven
#         expect(session[:user_id]).to eq(User.last.id)
#       end
  
#       it "sets your password if the confirmation matches" do
#         post :create, user: steven
#         expect(User.last.authenticate(steven[:password])).to eq(User.last) 
#       end
  
#       it "redirects you if your password and confirmation don't match" do
#         typo = steven.merge(password_confirmation: 'uni111verse')
#         post :create, user: typo
#         expect(response).to redirect_to(controller: 'users', action: 'new')
#       end
#     end
#   end