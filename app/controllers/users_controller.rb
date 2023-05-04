class UsersController < ApplicationController
  def index
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to "/"
    else
      redirect_to [:new, :user]
    end
  end

  def new
    @user = User.new()
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
