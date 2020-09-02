require_relative './cart'
require_relative './product'
require_relative './menu'

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
