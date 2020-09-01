require 'json'
require 'csv'
require_relative './models/products'
require "tty-prompt"

# DONE Load a list of products from a file. 
# DONE List product details to the user.
# Add products to a Shopping Cart. 
# Apply promotional discounts. 
# Calculate and display the total cost.

# def save_to_cart(product_for_cart)

#   # CSV.open('./cart.csv', 'a') do | csv |
#   #   csv << [[product_for_cart[0]["name"]], [product_for_cart[0]["price"]]]
#   # end
#   File.open("./cart.json", "a") do | item |
#     products_json = []
#     item.write(product_for_cart[0].to_json)
#     # item.puts product_for_cart[0].to_json
#   end
#   menu
# end

def menu
  p "Hi, welcome to Bob's Bits the #1 CLI Shop"
  prompt = TTY::Prompt.new
  menu_selection = prompt.select("Select a menu item", ["View All Products", "View Shopping Cart"])

  case menu_selection
  when "View All Products"
    view_all_products
  when "View Shopping Cart"
    view_shopping_cart
  else
    p "Bye"
  end
end

@shopping_cart = []

def add_to_cart(product_for_cart)
  # puts "----#{product_for_cart}"
  @shopping_cart.push(product_for_cart).flatten!
  # @shopping_cart.flatten!
  # puts "Shop Cart: #{@shopping_cart}"
  menu
end

def view_all_products
  # # Open & load products file (parse and read)
  file = File.open "./products.json"
  product_data = JSON.load file

  # Print out each items name for the menu selection
  options = []
  product_data.each do | item |
    options.push(item["name"])
  end

  # List product names so that user can select
  prompt = TTY::Prompt.new
  item_to_add_to_cart = prompt.select("Select which items to add to cart", options)
  # puts product_data
  # Match the name selected with product 
  product_for_cart = product_data.select do |product |
    item_to_add_to_cart == product["name"]
  end
  add_to_cart(product_for_cart)
  # save_to_cart(product_for_cart)
end

def view_shopping_cart
  subtotal = @shopping_cart.map {|item| item["price"]}.sum

  # Apply discount based on cart subtotal
  subtotal > 100.0 ? @total = subtotal - (subtotal * 20 / 100) : ""
  subtotal > 50.0 ? @total = subtotal - (subtotal * 15 / 100) : ""
  subtotal > 20.0 ? @total = subtotal - (subtotal * 10 / 100) : @total = subtotal

  puts `clear`
  # puts "Subtotal: #{subtotal}"
  puts "Products in Shopping Cart:"
  @shopping_cart.each_with_index do | item, i |
    puts "#{i + 1}. #{item["name"]} - $#{item["price"].round(2)}"
  end

  puts "Discount applied: NEED THIS TO BE A NICE VARIABLE on total greater than VARIABLE"
  # puts "#{@shopping_cart}"
  puts "Total After Discount: $#{@total.round(2)}"
  # pp @shopping_cart
end

begin
  menu
# rescue => exception
#   puts "Sorry that didn't work, please try again"
end
