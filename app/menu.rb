require 'tty-prompt'
require_relative './models/product.rb'

class Menu
  def display_menu
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
end