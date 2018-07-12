class SessionsController < ApplicationController

  def create
    @username = params[:username]
    user = User.find_by(username: @username)
    if user
      if user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to user_path(user)
      else
        flash[:notice] = "There is no user/password as entered"
        #--redirects to current page
        redirect_to request.env["HTTP_REFERER"]
      end
    else
      #--redirects to current page
      flash[:notice] = "There is no user/password as entered"
      redirect_to request.env["HTTP_REFERER"]
    end
  end

  def destroy
    session.clear
    redirect_to listings_path
  end


end
