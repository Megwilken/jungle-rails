require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    let(:category) { Category.create(name: 'Test Category') }
    let(:product) { Product.new(name: 'Test Product', price_cents: 1000, quantity: 5, category: category) }

    it 'saves successfully when all fields are set' do
      expect(product.save).to be true
    end

    it 'requires a name' do
      product.name = nil
      expect(product.save).to be false
      expect(product.errors.full_messages).to include("Name can't be blank")
    end
    it 'validates presence of category' do
      product = Product.new(category: nil)
      expect(product).to_not be_valid
      expect(product.errors[:category]).to include("can't be blank")
    end
    it 'validates presence of quantity' do
      product = Product.new(quantity: nil)
      expect(product).to_not be_valid
      expect(product.errors[:quantity]).to include("can't be blank")
    end
    it 'validates presence of price' do
      product = Product.new(price: nil)
      expect(product).to_not be_valid
     end
  end
end

