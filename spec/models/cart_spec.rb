require 'rails_helper'

RSpec.describe Cart, type: :model do
  
  it { should belong_to(:user) }
  it { should have_many(:orders) }
  #it { should have_many(:join_table_items_carts) }
  #it { should have_many(:items).through(:join_table_items_carts) }
  
  context 'Cart should appear correctly' do
  end
  
  context 'Cart should update correctly' do
    
  end

  context 'Cart should dialog correctly with orders' do
    
  end

  context 'Cart should be link to a definite user' do
    
  end

  context 'Cart should not be available when not logged in' do
    
  end

end
