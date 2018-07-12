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
    it 'if user is not logged in, they can not see a show page' do
      get :show, params: { id: 1 }
      expect(response).to redirect_to(root_path)
    end

end
