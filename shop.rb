require 'json'
require 'csv'
require "tty-prompt"
require_relative 'modules/cart'
require_relative 'modules/products.rb'

def menu
  puts "Hi, welcome to Bob's Bits the #1 CLI Shop"
  prompt = TTY::Prompt.new
  menu_selection = prompt.select("Select a menu item", ["View All Products", "View Shopping Cart", "Exit"])

  case menu_selection
  when "View All Products"
    Products::view_all_products
  when "View Shopping Cart"
    Cart::view_shopping_cart
  when "Exit"
    puts "Goodbye"
    puts `^c`
  end
end

# Initiate the CLI shop
begin
  menu
rescue => exception
end
