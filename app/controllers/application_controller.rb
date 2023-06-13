class ApplicationController < ActionController::Base
  before_action :configure_devise_parameters, if: :devise_controller?

    # Méthode pour configurer les paramètres Devise
    def configure_devise_parameters
      # Permet les paramètres spécifiés lors de l'inscription (sign_up)
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :street, :city, :zip_code, :email, :is_admin, :password, :password_confirmation])
    
      # Permet les paramètres spécifiés lors de la mise à jour du compte (account_update)
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :street, :city, :zip_code, :is_admin, :email, :password, :password_confirmation])
    end

end
