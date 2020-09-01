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

  product_for_cart = product_data.select do |product |
    item_to_add_to_cart == product["name"]
  end
  
end

def view_shopping_cart
  p shopping_cart
end

begin
  menu
# rescue => exception
#   puts "Sorry that didn't work, please try again"
end
