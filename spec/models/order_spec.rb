require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to(:cart) }
  #it { should have_many(:join_table_items_orders) }
  #it { should have_many(:items).through(:join_table_items_orders) }
end
