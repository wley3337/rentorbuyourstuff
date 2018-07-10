class SessionsController < ApplicationController

  # def new
  #   render layout: false
  # end

  def create


    @username = params[:username]
    user = User.find_by(username: @username)
    if user
      if user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to user_path(user)
      else
        flash[:notice] = "There is no user/password as entered"
        redirect_to request.env["HTTP_REFERER"]
      end
    else
      flash[:notice] = "There is no user/password as entered"
      redirect_to request.env["HTTP_REFERER"]
    end
  end

  def destroy
    session.clear
    redirect_to listings_path
  end


end
