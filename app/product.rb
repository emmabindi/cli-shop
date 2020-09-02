require 'json'

module Products
  class Product 
    attr_accessor :uuid, :name, :price
    def initialize(uuid, name, price) 
      @uuid = uuid
      @name = name
      @price = price
    end
  end

  def self.view_all_products(cart)
    # # Open & load products file (parse and read)
    file = File.open "./products.json"
    product_data = JSON.load file
  
    product_list = product_data.each do | product |
      Product.new(product["uuid"], product["name"], product["price"])
    end
  
    # Print out each items name for the menu selection
    options = []
    product_list.each do | item |
      details = item["name"] + " $" + ('%.2f' % item["price"]).to_s
      options.push(details)
    end

    # List product names so that user can select
    prompt = TTY::Prompt.new
    puts `clear`
    item_to_add_to_cart = prompt.select("Select which items to add to cart", options)
    
    # Match the name selected with product 
    product_for_cart = product_list.select do |product |
      item_to_add_to_cart.include?(product["name"])
    end
    cart.add_to_cart(product_for_cart)
  end
end