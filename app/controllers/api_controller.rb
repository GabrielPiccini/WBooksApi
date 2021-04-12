class ApiController < ActionController::API
  respond_to :json
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?
  include ActionView::Layouts

  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: [
        {
          status: '400',
          title: 'Bad Request',
          detail: resource.errors,
          code: '100'
        }
      ]
    }, status: :bad_request
  end

  protected

  def configure_permitted_parameters
    # rubocop:disable Layout/LineLength
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[password password_confirmation email first_name last_name])
    # rubocop:enable Layout/LineLength
  end
end
