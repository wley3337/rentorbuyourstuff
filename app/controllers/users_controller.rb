class UsersController < ApplicationController
  before_action :find_user, only:[:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(list_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
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
      params.require(:user).permit(:name, :password_digest, :username)
    end

    def find_user
      @user = User.find(params[:id])
    end

end
