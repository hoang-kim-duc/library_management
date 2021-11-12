class Api::BooksController < ApplicationController
  include Api::BooksControllerDocument

  before_action :authenticate_user!
  load_and_authorize_resource class: Book
  before_action :set_book, only: [:show, :update, :destroy]


  # GET /books
  def index
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true)

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
      params.require(:book).permit(:name, :author, :cover, :description, :category_id, :data).merge user_id: current_user.id
    end
end
