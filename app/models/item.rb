class Item < ApplicationRecord
  belongs_to :cart
  has_many :orders, dependent: :destroy
  has_one_attached :picture
end
