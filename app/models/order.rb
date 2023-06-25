class Order < ApplicationRecord
  belongs_to :item
  belongs_to :cart
  has_one_attached :picture

  def unit_price
    item.price
  end

  def total_price
    unit_price * quantity
  end

  def self.add_or_create_cart_item_link(permit_link_params)
    # Recherche d'un élément de commande existant pour le panier et l'article donnés
    @new_item_add = Order.find_by(cart_id: permit_link_params[:cart_id], item_id: permit_link_params[:item_id])
    
    if @new_item_add.nil?
      # Si aucun élément de commande n'existe, en créer un avec une quantité de 1
      @new_item_add = Order.create(item_id: permit_link_params[:item_id], cart_id: permit_link_params[:cart_id], quantity: 1)
      # Joindre l'image de l'article à l'élément de commande nouvellement créé
      @new_item_add.picture.attach(Item.find_by(id: permit_link_params[:item_id]).picture.blob)
    else
      # Si un élément de commande existe déjà, augmenter la quantité de 1
      @new_item_add.update(quantity: @new_item_add.quantity + 1)
    end
    
    @new_item_add
end
