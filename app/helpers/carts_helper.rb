module CartsHelper
  def only_current_cart
    if current_user != nil && current_user.cart.id != params[:id].to_i
        return redirect_to cart_path(current_user.cart.id)
    end
  end

  private
  
  def require_login
      unless current_user != nil
          redirect_to new_user_session_path
      end
  end
end
