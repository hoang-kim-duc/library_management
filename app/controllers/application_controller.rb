class ApplicationController < ActionController::API
  acts_as_token_authentication_handler_for User, {fallback: :none}
  respond_to :json

  rescue_from CanCan::AccessDenied do
    render json: {
      messages: "You are not allow to perform this action!",
    }, status: :forbidden
  end

  private

  def current_user
    @current_user ||= User.find_by authentication_token: request.headers["Authorization"]
  end

  def authenticate_user!
    return if current_user.present?

    render json: {
      messages: "Authorization failed!",
    }, status: :unauthorized
  end
end
