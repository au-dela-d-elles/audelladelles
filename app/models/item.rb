class Item < ApplicationRecord
  belongs_to :cart
  has_many :orders, dependent: :nullify
end
