require 'rspec'
require 'spec_helper'

class Product 
  attr_accessor :uuid, :name, :price
  def initialize(uuid, name, price) 
    @uuid = uuid
    @name = name
    @price = price
  end
end

RSpec.describe Product do
  let (:product) { Product.new(123, "Gadget", 12.50)}

  it 'has a name' do
    product.name = "Thingo"
    expect(product.name).to eq("Thingo")
  end

  it 'has an ID' do
    product.uuid = 458
    expect(product.uuid).to eq(458)
  end

  it 'has a price' do
    product.price = 45.78
    expect(product.price).to eq(45.78)
  end
end