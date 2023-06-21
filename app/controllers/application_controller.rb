class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :configure_devise_parameters, if: :devise_controller?
  
  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :fisrt_name, :last_name, :street, :city, :zip_code, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys:  [:email,:fisrt_name, :last_name, :street, :city, :zip_code, :password, :password_confirmation])
  end
  
  after_action :create_cart_and_assign_to_current_user, only: [:create]
end
