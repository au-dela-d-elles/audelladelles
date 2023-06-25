class ApplicationController < ActionController::Base
  include ApplicationHelper
  
  # Configuration des paramètres Devise pour l'inscription et la mise à jour du compte utilisateur
  before_action :configure_devise_parameters, if: :devise_controller?
  
  def configure_devise_parameters
    # Autoriser les paramètres spécifiés lors de l'inscription
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :last_name, :street, :city, :zip_code, :password, :password_confirmation])
    
    # Autoriser les paramètres spécifiés lors de la mise à jour du compte
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :first_name, :last_name, :street, :city, :zip_code, :password, :password_confirmation])
  end
  
  # Créer un panier et l'attribuer à l'utilisateur courant après l'action de création
  after_action :create_cart_and_assign_to_current_user, only: [:create]
end
