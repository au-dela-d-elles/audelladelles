module ItemsHelper
  # Enregistre les articles dans le panier de l'utilisateur actuel
  def save_items_in_cart
    if current_user != nil
        @items_in_cart = Order.where(cart_id:current_user.cart.id)
    end
  end
end
