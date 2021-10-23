class ApplicationController < ActionController::API
  acts_as_token_authentication_handler_for User, {fallback: :none}
  respond_to :json

  private

  def current_user

    byebug

    @current_user ||= User.find_by authentication_token: request.headers["Authorization"] #token thông qua header
  end
end
