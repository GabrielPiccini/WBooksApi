class BooksController < ApiController
  include Wor::Paginate
  before_action :authenticate_user!

  def index
    @books = Book.all.order(:id)
    render_paginated @books
  end

  def show
    @book = Book.find(params[:id])
    render json: @book
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'The book cannot be found' }, status: :not_found
  end
end
