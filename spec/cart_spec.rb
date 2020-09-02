require 'rspec'
require 'spec_helper'

class Cart 
  def initialize
    @shopping_cart = []
  end
end

RSpec.describe Cart do
  let (:cart) { Cart.new }

  it 'is an instance of Cart' do
    expect(cart.class).to eq(Cart)
  end
end