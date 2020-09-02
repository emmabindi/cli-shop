require_relative 'cart.rb'

module Products
  def self.view_all_products
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
    Cart::add_to_cart(product_for_cart)
    # add_to_cart(product_for_cart)
  end
end