class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with :name => ENV["ADMIN_USERNAME"], :password => ENV["ADMIN_PASSWORD"]

  def index
    @categories = Category.all
  end

  # New is where the form is created
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories]
    else
      render :new
    end
  end

  private

  # Need to setup params to receieve, and secure which ones can be filled
  def category_params
    params.require(:category).permit(:name)
  end
end
