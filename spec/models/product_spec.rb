require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'validation tests' do
    it 'ensures name presence' do
      product = Product.new(price: 10).save
      expect(product).to eq(false)
    end

    it 'ensures description presence' do
      product = Product.new(price: 10).save
      expect(product).to eq(false)
    end

    it 'ensures price presence' do
      product = Product.new(quantity: 10).save
      expect(product).to eq(false)
    end

    it 'ensures quantity presence' do
      product = Product.new(price: 10).save
      expect(product).to eq(false)
    end

    it 'ensures quantity greater than -1' do
      product = Product.new(quantity: -2).save
      expect(product).to eq(false)
    end

    it 'ensures price greater than -1' do
      product = Product.new(price: -2).save
      expect(product).to eq(false)
    end

    it 'should save successfully' do
      product = Product.new(name: "product", description: "description", price: 10, quantity: 2).save
      expect(product).to eq(true)
    end

  end
end
