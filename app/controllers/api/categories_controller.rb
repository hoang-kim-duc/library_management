class Api::CategoriesController < ApplicationController
  include Api::CategoriesControllerDocument

  before_action :authenticate_user!
  load_resource class: Category

  # GET /books
  def index
    @categories = Category.all

    render json: @categories
  end

  def update
    if @category.update category_params
      render json: @category, status: :created
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :image)
  end
end
