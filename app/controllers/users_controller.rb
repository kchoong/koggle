class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def create
    user_params = params.require(:user).permit(:username, :firstname, :lastname, :email, :birthday)
    @user = User.new(user_params)
    if @user.valid?
      @user.save!
      redirect_to users_path
    else
      render "users/new"
    end

  end

  def new
    @user = User.new
  end

  def edit

  end

  def show

  end

  def update

  end

  def destroy

  end
end
