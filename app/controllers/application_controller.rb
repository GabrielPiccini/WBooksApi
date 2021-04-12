class ApplicationController < ActionController::Base
  respond_to :json
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token

  def authenticate_admin_user!
    if admin_user_signed_in?
      super
    else
      redirect_to new_admin_user_session_path
    end
  end
end
