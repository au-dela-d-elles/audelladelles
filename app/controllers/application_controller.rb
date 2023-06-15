class ApplicationController < ActionController::Base
  before_action :configure_devise_parameters, if: :devise_controller?
  before_action :set_render_cart, if: :devise_controller?


  def set_render_cart
    @render_cart = true
  end

  def initialize_cart
    @cart ||= Cart.find_by(id: session[:cart_id])
  
    if @cart.nil?
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end
  


  # Méthode pour configurer les paramètres Devise
  def configure_devise_parameters
    # Permet les paramètres spécifiés lors de l'inscription (sign_up)
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :street, :city, :zip_code, :email, :is_admin, :password, :password_confirmation])
    
    # Permet les paramètres spécifiés lors de la mise à jour du compte (account_update)
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :street, :city, :zip_code, :is_admin, :email, :password, :password_confirmation])
  end

end
