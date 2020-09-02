require_relative './cart'
require_relative './product'
require_relative './menu'

class Controller
  def initialize
    @cart = Cart.new
    @menu = Menu.new(@cart)
  end

  def run
    loop do
      @menu.display_menu
    end
  end
end
