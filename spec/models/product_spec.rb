require 'rails_helper'

RSpec.describe Product, type: :model do
    context 'Product should be created correctly' do
      it 'creates a valid product' do
        product = Product.new(name: 'Test Product', price: 10.99)
        expect(product).to be_valid
      end
  
      it 'requires a name' do
        product = Product.new(price: 10.99)
        expect(product).not_to be_valid
      end
  
      it 'requires a price' do
        product = Product.new(name: 'Test Product')
        expect(product).not_to be_valid
      end
    end
  
    context 'Product should be modified correctly' do
      let(:product) { Product.create(name: 'Test Product', price: 10.99) }
  
      it 'updates the name' do
        product.update(name: 'Updated Product')
        expect(product.reload.name).to eq('Updated Product')
      end
  
      it 'updates the price' do
        product.update(price: 19.99)
        expect(product.reload.price).to eq(19.99)
      end
    end
  
    context 'Product should be deleted correctly' do
      let!(:product) { Product.create(name: 'Test Product', price: 10.99) }
  
      it 'deletes the product' do
        expect {
          product.destroy
        }.to change(Product, :count).by(-1)
      end
    end
  end
  
