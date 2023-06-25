module CartsHelper
  # Vérifie si le panier actuel correspond à celui de l'utilisateur actuel
  def only_current_cart
    if current_user != nil && current_user.cart.id != params[:id].to_i
      return redirect_to cart_path(current_user.cart.id)
    end
  end

  # Calcule le prix total des articles dans le panier
  def calculate_total_price(items)
    items.sum { |item| item.quantity * item.item.price }
  end

  private

  # Vérifie si l'utilisateur est connecté
  def require_login
    unless current_user != nil
      redirect_to new_user_session_path
    end
  end
end
