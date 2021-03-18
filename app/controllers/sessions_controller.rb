class SessionsController < Devise::SessionsController
  respond_to :json
  before_action :rewrite_param_names, only: [:create]

  # rubocop:disable Lint/UselessMethodDefinition
  def create
    super
  end
  # rubocop:enable Lint/UselessMethodDefinition
  private

  def respond_with(resource, _opts = {})
    render json: resource
  end

  def respond_to_on_destroy
    head :no_content
  end

  def rewrite_param_names
    return unless params[:session]

    request.params[:user] =
      { email: request.params[:session][:email], password: request.params[:session][:password] }
  end
end
