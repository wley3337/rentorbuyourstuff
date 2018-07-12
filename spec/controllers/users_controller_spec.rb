require 'rails_helper'
# * Not logged in -will
#   -can't see user/show


RSpec.describe UsersController, type: :controller do

  it 'if user is not logged in, they can not see a show page' do
    get :show, params: { id: 1 }
    expect(response).to redirect_to(root_path)
  end





end
