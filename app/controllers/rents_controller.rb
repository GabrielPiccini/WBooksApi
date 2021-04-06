class RentsController < ApplicationController
  before_action :authenticate_user!
  before_action :rent_params, only: [:create]

  def index
    @rents = current_user.rents
    return render json: { error: 'The user has no rents' }, status: :not_found if @rents.empty?

    render json: @rents.order(:id).page(params[:page])
  end

  def create
    @book = Book.find(params[:rent][:book_id])
    @rent = Rent.create(user: current_user, book: @book, from: params[:rent][:from],
                        to: params[:rent][:to])
    render json: @rent
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'The book cannot be found' }, status: :not_found
  end

  private

  def rent_params
    params.require(:rent).permit(:book_id, :from, :to).tap do |rent_params|
      rent_params.require(:book_id)
      rent_params.require(:from)
      rent_params.require(:to)
    end
  rescue ActionController::ParameterMissing
    render json: { error: 'Parameter is missing' }, status: :unprocessable_entity
  end
end
