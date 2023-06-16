require 'rails_helper'

RSpec.describe Item, type: :model do
  context 'Item should be created correctly' do
    it 'creates a valid product' do
      product = Item.new(name: 'Test Item', price: 10.99)
      expect(product).to be_valid
    end

    it 'requires a name' do
      product = Item.new(price: 10.99)
      expect(product).not_to be_valid
    end

    it 'requires a price' do
      product = Item.new(name: 'Test Item')
      expect(product).not_to be_valid
    end
  end

  context 'Item should be modified correctly' do
    let(:product) { Item.create(name: 'Test Item', price: 10.99) }

    it 'updates the name' do
      product.update(name: 'Updated Item')
      expect(product.reload.name).to eq('Updated Item')
    end

    it 'updates the price' do
      product.update(price: 19.99)
      expect(product.reload.price).to eq(19.99)
    end
  end

  context 'Item should be deleted correctly' do
    let!(:product) { Item.create(name: 'Test Item', price: 10.99) }

    it 'deletes the product' do
      expect {
        product.destroy
      }.to change(Item, :count).by(-1)
    end
  end
end
