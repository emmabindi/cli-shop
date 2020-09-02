require_relative './models/cart'
require_relative './models/product'
require_relative './views/menu'

class Controller
  # attr_reader :cart
  def initialize
    # @cart = Cart::Cart.new
    @menu = Menu.new
  end

  def run
    loop do
      @menu.display_menu
    end
  end
end
