class UsersController < ApplicationController
  before_action :find_user, only:[:show, :edit, :update, :destroy]



  def show

  end

  def new
    @user = User.new
    render layout: false

  end

  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id]= @user.id
        redirect_to user_path(@user)
      else
        render :new
      end
  end

  def edit
    render layout: false
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    #don't forget to manage all dependants like exchanges and listings
  end



  private

    def user_params
      params.require(:user).permit(:name, :password, :username, :password_confirmation)
    end

    def find_user
      if current_user
        @user = current_user
      else
        flash[:notice] = "Please Log In"
        redirect_to root_path
      end
    end



end
