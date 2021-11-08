class Api::CategoriesController < ApplicationController
  include Api::CategoriesControllerDocument

  before_action :authenticate_user!

  # GET /books
  def index
    @categories = Category.all

    render json: @categories
  end
end
