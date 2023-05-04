class UsersController < ApplicationController
  def index
  end

  def create
  end

  def new
    @user = User.new
  end
end
