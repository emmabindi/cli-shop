require_relative './models/cart'
require_relative './models/product'
require_relative './views/menu'

class Controller
  def initialize
    @menu = Menu.new
  end

  def run
    loop do
      @menu.display_menu
    end
  end
end
