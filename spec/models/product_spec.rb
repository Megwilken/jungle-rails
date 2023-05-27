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

    
  end
end

