def view_shopping_cart
  subtotal > 100.0 ? @total = subtotal - (subtotal * 20 / 100) : ""
  subtotal > 50.0 ? @total = subtotal - (subtotal * 15 / 100) : ""
  subtotal > 20.0 ? @total = subtotal - (subtotal * 10 / 100) : @total = subtotal
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