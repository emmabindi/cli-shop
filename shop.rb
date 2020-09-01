require 'json'
require 'csv'
require_relative './models/products'
require "tty-prompt"

# DONE Load a list of products from a file. 
# DONE List product details to the user.
# Add products to a Shopping Cart. 
# Apply promotional discounts. 
# Calculate and display the total cost.

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
  prompt = TTY::Prompt.new
  # Read products file 
  file = File.read('./products.json')
  # Parse json into hash
  products_json = JSON.parse(file)
  # Display the products hash
  product_list = []
  products_json.each do | product |
    row = product.to_hash
    product_list.push(Product.new(row['uuid'], row['name'], row['price']))
  end
  # Print out each items name
  options = []
  product_list.each do | item |
    options.push(item.name)
  end 
  # List product names so that user can select
  item_to_add_to_cart = prompt.select("Select which items to add to cart", options)
end

def view_shopping_cart
  p shopping_cart
end

begin
  menu

  # shopping_cart = []
  # shopping_cart.push(item_to_add_to_cart)
  # p shopping_cart

  # CSV.generate do | csv |
  #   csv << [:blue, 1]
  #   csv << [:white, 2]
  # end
  
  
# rescue => exception
#   puts "Sorry that didn't work, please try again"
end
