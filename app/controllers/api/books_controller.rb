class Api::BooksController < ApplicationController
  include Rails.application.routes.url_helpers
  include Api::BooksControllerDocument

  before_action :set_book, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /books
  def index
    @books = Book.all

    render json: @books
  end

  # GET /books/1
  def show
    render json: @book
  end

  # POST /books
  def create
    @book = Book.new(book_params)
    if @book.save
      render json: @book, status: :created
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: @book, status: :created
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    if @book.destroy
      render json: {
        messages: "Delete successfully!",
        is_success: true
      }, status: :ok
    else
      render json: {
        messages: "Delete failed!",
        is_success: false
      }, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    rescue
      render json: {
        messages: "Resource not found!",
      }, status: :unprocessable_entity
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:name, :description, :data)
    end
end
