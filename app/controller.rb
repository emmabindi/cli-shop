require_relative './models/product'
require_relative './models/cart'
require_relative './menu'

class Controller
  def initialize
    @product = Product.new(12, "thing", 45.32)
    @cart = Cart.new
    @menu = Menu.new
  end

  def run
    loop do
      @menu.display_menu
    end
  end
end