require 'json'
require 'csv'
require_relative './models/products'
require "tty-prompt"

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
  @shopping_cart.push(product_for_cart).flatten!
  puts `clear`
  menu
end

def view_all_products
  # # Open & load products file (parse and read)
  file = File.open "./products.json"
  product_data = JSON.load file

  # Print out each items name for the menu selection
  options = []
  product_data.each do | item |
    details = item["name"] + " $" + ('%.2f' % item["price"]).to_s
    options.push(details)
  end

  # List product names so that user can select
  prompt = TTY::Prompt.new
  puts `clear`
  item_to_add_to_cart = prompt.select("Select which items to add to cart", options)
  # Match the name selected with product 
  product_for_cart = product_data.select do |product |
    item_to_add_to_cart.include?(product["name"])
  end
  add_to_cart(product_for_cart)
end

def view_shopping_cart
  def discount_calc
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
  puts "Total After Discount: $#{@cart_data[:total].round(2)}\n\n"
end

begin
  menu
# rescue => exception
#   puts "Sorry that didn't work, please try again"
end
