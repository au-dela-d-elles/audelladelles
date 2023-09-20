class OrdersController < ApplicationController
  def create
    @item_add = Order.add_or_create_cart_item_link(permit_link_params)
    redirect_to items_path
  end

  def update
  end

  def destroy
    @item_delete = Order.find(params[:id])
    @item_delete.destroy
    redirect_to cart_path
  end

  private

  def permit_link_params
    params.require(:order).permit(:item_id, :cart_id, :quantity, :picture)
  end
end
