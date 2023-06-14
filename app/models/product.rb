class Product < ApplicationRecord
  validates :name, :price, presence: true
  has_one_attached :image
end
