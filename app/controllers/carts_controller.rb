class CartsController < ApplicationController
  include CartsHelper
  
  # Vérifier si l'utilisateur est connecté avant d'exécuter les actions du contrôleur
  before_action :require_login
  
  # Vérifier si l'utilisateur a un panier actif avant d'exécuter les actions du contrôleur
  before_action :only_current_cart

  def show
    # Récupérer le panier de l'utilisateur courant
    @cart = current_user.cart
    # Récupérer les articles dans le panier
    @items_in_cart = Order.where(cart_id: current_user.cart.id)
    # Calculer le prix total des articles dans le panier
    @total_price = calculate_total_price(@items_in_cart)
  end

  def create
    # À compléter
  end

  def update
    # Récupérer le panier de l'utilisateur courant
    @cart = current_user.cart
    
    # Rediriger vers la page du panier
    redirect_to cart_path
  end

  def destroy
    # Récupérer le panier de l'utilisateur courant
    @cart = current_user.cart
    
    # Supprimer le panier
    @cart.destroy
    
    # Rediriger vers la liste des paniers
    redirect_to carts_path
  end
end
