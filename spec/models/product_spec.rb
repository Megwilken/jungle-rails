require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'validates presence of name' do
      product = Product.new(name: nil)
      expect(product).to_not be_valid
      expect(product.errors[:name]).to include("can't be blank")
    end
    it 'validates presence of price' do
      product = Product.new(price: nil)
      expect(product).to_not be_valid
      expect(product.errors[:price]).to include("can't be blank")
    end
    it 'validates presence of quantity' do
      product = Product.new(quantity: nil)
      expect(product).to_not be_valid
      expect(product.errors[:quantity]).to include("can't be blank")
    end
end
