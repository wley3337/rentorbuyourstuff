Rails.application.routes.draw do
  # get "/login", to: 'sessions#new' -don't need because we have log in header in app layout
  post "/login", to: 'sessions#create'
  delete "/logout", to: 'sessions#destroy'
  resources :exchanges, only: [:show, :new, :create]
  resources :listings
  resources :users, only: [:show, :new, :create, :edit, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
