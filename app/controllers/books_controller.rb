class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
    @books = Book.order(:id).page(params[:page])
    render json: @books
  end

  def show
    @book = Book.find(params[:id])
    render json: @book
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Not_found' }, status: :not_found
  end
end
