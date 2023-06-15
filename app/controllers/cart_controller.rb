class CartController < ApplicationController
  before_action :authenticate_user!
  before_action :initialize_cart

  def show
    @render_cart = false
    @cart = current_user.cart
    @total_price = @cart.total
  end

  def add
    @product = Product.find_by(id: params[:product_id])
    quantity = params[:quantity].to_i
    current_orderable = @cart.orderables.find_by(product_id: @product.id)
    if current_orderable && quantity > 0
      current_orderable.update(quantity: quantity)
    elsif quantity <= 0
      current_orderable.destroy
    else
      @cart.orderables.create(product: @product, quantity: quantity)
    end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [turbo_stream.replace('cart',
                                                   partial: 'cart/cart',
                                                   locals: { cart: @cart }),
                              turbo_stream.replace(@product)]
      end
    end
  end
  
  def remove
    Orderable.find_by(id: params[:id]).destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('cart',
                                                  partial: 'cart/cart',
                                                  locals: { cart: @cart })
      end
    end
  end

  private

  def initialize_cart
    @cart = current_user.cart || Cart.create(user: current_user)
  end
  
end

