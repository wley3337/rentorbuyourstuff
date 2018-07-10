class SessionsController < ApplicationController

  def new

  end

  def create
    @username = params[:username]
    user = User.find_by(username: @username)
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
      # if params[listings: :id]
      #   redirect_to listing_path
    else
      render :new
    end
  end


end
