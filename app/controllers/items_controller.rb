# app/controllers/items_controller.rb
class ItemsController < ApplicationController
  include ItemsHelper
  before_action :save_items_in_cart
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
    @item = Item.new
    @order_cart = Order.new
  end

  def show
    @item = Item.find(params[:id])
    @order_cart = Order.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.picture.attach(params[:item][:picture])
    if current_user && current_user.cart
      @item.cart = current_user.cart 
      if @item.save
        redirect_to item_path(@item), notice: 'L\'article a été créé avec succès.'
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item), notice: 'L\'article a été mis à jour avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: 'L\'article a été supprimé avec succès.'
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :price, :picture)
  end
end

