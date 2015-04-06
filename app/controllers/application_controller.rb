class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  # Send 'em back where they came from with a slap on the wrist
  def authority_forbidden(error)
    Authority.logger.warn(error.message)
    redirect_to request.referrer.presence || root_path, :alert => '사용자 인증에 실패하였습니다.'
  end

  protected

  # for adding user name attribute to Devise gem
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :profile, :email, :password, :password_confirmation, :remember_me, :auth_token) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :profile, :email, :password, :password_confirmation, :current_password) }
  end
end
