require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    it 'should save when name, price, quantity, and category are specificed' do
      category = Category.new
      product = Product.new(name: 'Some Plant', price:2003, quantity: 3, category: category)
      product.save
      expect(product.errors.full_messages).to match_array([])
    end

    it 'should not save with invalid name' do
      category = Category.new
      product = Product.new(name: nil, price:2003, quantity: 3, category: category)
      product.save
      expect(product.errors.full_messages).to include('Name can\'t be blank')
    end

   




  end
end
