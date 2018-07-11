class ApplicationController < ActionController::Base
helper_method :current_user

  def current_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def path_not_found
    flash[:notice] = "Path not found"
    redirect_to request.env["HTTP_REFERER"]
  end

end
