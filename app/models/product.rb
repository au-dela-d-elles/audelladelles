class Product < ApplicationRecord
  belongs_to :cart
  has_many :orderables
  has_many :carts, through: :orderables

  has_one_attached :image

  validates :name, :price, presence: true
end
