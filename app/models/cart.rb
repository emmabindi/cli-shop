require 'tty-prompt'

module Cart
  @shopping_cart = []

  def self.add_to_cart(product_for_cart)
    @shopping_cart.push(product_for_cart).flatten!
    puts @shopping_cart
    puts `clear`
  end

  def self.view_shopping_cart
    def self.discount_calc
      subtotal = @shopping_cart.map {|item| item["price"]}.sum
      @cart_data = {}
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
      return @cart_data
    end
    discount_calc
    puts "Products in Shopping Cart:"
    @shopping_cart.each_with_index do | item, i |
      puts "  #{i + 1}. #{item["name"]} - $#{'%.2f' % item["price"]}\n\n"
    end
    puts "Discount applied: #{@cart_data[:discount]}%\n\n"
    puts "Total After Discount: $#{'%.2f' % @cart_data[:total]}\n\n"
  end
end