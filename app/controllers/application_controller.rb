class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action :configure_permitted_parameters, if: :devise_controller?

protected

def configure_permitted_parameters
  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :zipcode, :email, :password, :password_confirmation, :avatar, :username) }
  devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :zipcode, :email, :password, :password_confirmation, :current_password, :avatar, :username) }
end

private
def current_user_sc
 @current_user ||= User.find(session[:user_id]) if session[:user_id]
 end
 helper_method :current_user_sc



end
