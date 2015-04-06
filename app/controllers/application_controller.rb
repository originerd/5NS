class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  # for adding user name attribute to Devise gem
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :profile, :email, :password, :password_confirmation, :remember_me, :auth_token) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :profile, :email, :password, :password_confirmation, :current_password) }
  end
end
