Rails.application.routes.draw do
  # get "/login", to: 'sessions#new' -don't need because we have log in header in app layout
  root "listings#index"
  post "/login", to: 'sessions#create'
  delete "/logout", to: 'sessions#destroy'
  get "/exchanges/:listing_id/new", to: 'exchanges#new'
  resources :exchanges, only: [:show, :create]
  resources :listings
  resources :users, only: [:show, :new, :create, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match "*path", to: "application#path_not_found", via: [:get, :post]
end
