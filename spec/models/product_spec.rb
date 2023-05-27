require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'validates presence of name' do
      product = Product.new(name: nil)
      expect(product).to_not be_valid
      expect(product.errors[:name]).to include("can't be blank")
    end
end
