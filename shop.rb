require 'json'
require_relative 'products'
require "tty-prompt"

prompt = TTY::Prompt.new

# Load a list of products from a file. 
# List product details to the user.
# Add products to a Shopping Cart. 
# Apply promotional discounts. 
# Calculate and display the total cost.

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

prompt.select("Choose your item", options)