class CartsController < ApplicationController
  include CartsHelper
  before_action :require_login
  before_action :only_current_cart

  def show
    @cart = current_user.cart
    @items_in_cart = Order.where(cart_id:current_user.cart.id)
  end

  def create
  end

  def update
    @cart = current_user.cart
    redirect_to cart_path
  end

  def destroy
    @cart = current_user.cart
    @cart.destroy
    redirect_to carts_path
  end
end
