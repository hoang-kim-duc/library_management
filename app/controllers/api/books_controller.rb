class Api::BooksController < ApplicationController
  include Rails.application.routes.url_helpers
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
      cover_url = rails_blob_path(@book.data, disposition: "attachment", only_path: true)
      render json: @book, status: :created, location: cover_url
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:name, :description, :data)
    end
end
