require 'tty-prompt'

module Cart
  @shopping_cart = []

  # Add the product selected to the shopping cart array
  def self.add_to_cart(product_for_cart)
    @shopping_cart.push(product_for_cart).flatten!
    puts `clear`
  end

  def self.view_shopping_cart
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