require 'rspec'
require 'spec_helper'

class Cart
  attr_accessor :shopping_cart
  def initialize
    @shopping_cart = []
  end

  # Add the product selected to the shopping cart array
  def add_to_cart(product_for_cart)
    @shopping_cart.push(product_for_cart).flatten!
    puts `clear`
  end

  def view_shopping_cart
    # apply promo discounts based on cart subtotal
    def self.discount_calc
      # calculator subtotal of items in cart
      subtotal = @shopping_cart.map {|item| item["price"]}.sum
      @cart_data = {}
      # track the discount for display & calc later on
      if subtotal >= 100.0 
        @cart_data[:discount] = 20
      elsif subtotal >= 50
        @cart_data[:discount] = 15
      elsif subtotal >= 20.0
        @cart_data[:discount] = 10
      else
        @cart_data[:discount] = 0
      end
      @cart_data[:total] = (subtotal - (subtotal * @cart_data[:discount] / 100.00))
      @cart_data[:savings] = subtotal - @cart_data[:total]
      return @cart_data
    end
    # run the discount calculator
    discount_calc
    # Output cart to the user
    puts ""
    puts "Products in Shopping Cart:"
    @shopping_cart.each_with_index do | item, i |
      puts "  #{i + 1}. #{item["name"]} - $#{'%.2f' % item["price"]}\n\n"
    end
    puts "Discount applied: #{@cart_data[:discount]}% (Total Savings $#{'%.2f' % @cart_data[:savings]}!)\n\n"
    puts "Total After Discount: $#{'%.2f' % @cart_data[:total]}\n\n"
  end
end

class Product 
  attr_accessor :uuid, :name, :price
  def initialize(uuid, name, price) 
    @uuid = uuid
    @name = name
    @price = price
  end
end

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