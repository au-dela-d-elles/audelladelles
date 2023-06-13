class Product < ApplicationRecord
  validates :name, :price, presence: true

end
