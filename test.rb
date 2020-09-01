# def view_shopping_cart
#   subtotal > 100.0 ? @total = subtotal - (subtotal * 20 / 100) : ""
#   subtotal > 50.0 ? @total = subtotal - (subtotal * 15 / 100) : ""
#   subtotal > 20.0 ? @total = subtotal - (subtotal * 10 / 100) : @total = subtotal
# end

# puts view_shopping_cart


# return an array with the applied discount, new total and savings amount

def view_shopping_cart
  subtotal = 9
  cart_data = {}
  if subtotal >= 100.0 
    cart_data[:discount] = 20
  elsif subtotal >= 50
    cart_data[:discount] = 15
  elsif subtotal >= 20.0
    cart_data[:discount] = 10
  else
    cart_data[:discount] = 0
  end
  cart_data[:total] = (subtotal - (subtotal * cart_data[:discount] / 100.00))
  return cart_data
end

puts view_shopping_cart





# def view_shopping_cart
#   subtotal = 45

#   def promotional(subtotal)
#     subtotal > 100.0 ? 20 : ""
#     subtotal > 50.0 ? 15 : ""
#     subtotal > 20.0 ? 10 : 100
#     puts subtotal
#   end
#   puts promotional
# end

# puts view_shopping_cart