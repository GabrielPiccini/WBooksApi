class RentsController < ApiController
  before_action :authenticate_user!
  before_action :rent_params, only: [:create]
  after_action :send_email, only: [:create], if: -> { @book }

  after_action :verify_policy_scoped, only: [:index]
  after_action :verify_authorized, only: [:create]

  def index
    @rents = policy_scope(Rent)
    return render json: { error: 'The user has no rents' }, status: :not_found if @rents.empty?

    authorize @rents
    render json: @rents.order(:id).page(params[:page])
  end

  def create
    @book = Book.find(params[:rent][:book_id])
    @rent = Rent.create(user: current_user, book: @book, from: params[:rent][:from],
                        to: params[:rent][:to])
    authorize @rent
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

  def send_email
    @user = current_user
    book = @book[:title]
    rent_mail = { email: @user[:email], name: @user[:first_name],
                  from: @rent[:from], to: @rent[:to],
                  book: book, locale: @user[:locale] }
    MailerWorker.perform_async(rent_mail)
  end
end
