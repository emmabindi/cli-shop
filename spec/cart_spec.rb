require 'rspec'
require 'spec_helper'
require './app/cart.rb'
require './app/product.rb'

RSpec.describe Cart do
  let (:cart) { Cart.new }
  let (:product) { Product.new(123, "Gadget", 12.50)}

  it 'is an instance of Cart' do
    expect(cart.class).to eq(Cart)
  end

  it 'adds product object to shopping cart array' do
    cart.add_to_cart(product) 
    expect(cart.shopping_cart).to include(Product)
  end

  it 'adds multiple products to shopping cart array' do
    cart.add_to_cart(product)
    cart.add_to_cart(product) 
    expect(cart.shopping_cart.length).to eq(2)
  end
end