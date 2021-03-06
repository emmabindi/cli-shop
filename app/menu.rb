require 'tty-prompt'
require_relative './product.rb'
require_relative './cart.rb'

class Menu
  def initialize(cart)
    @cart = cart
  end

  puts "Hi, welcome to Bob's Bits the #1 CLI Shop"
  def display_menu
    puts "--------------------------------------------------------------"
    prompt = TTY::Prompt.new
    menu_selection = prompt.select("Select a menu item", ["View All Products", "View Shopping Cart", "Exit"])
  
    case menu_selection
    when "View All Products"
      Products::view_all_products(@cart)
    when "View Shopping Cart"
      @cart.view_shopping_cart
    when "Exit"
      puts "Goodbye"
      exit
    end
  end
end