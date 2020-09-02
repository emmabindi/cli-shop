require_relative 'cart'
require_relative 'cart_controller'
require_relative 'router'

cart = Cart.new
controller = CartController.new
router = Router.new(controller)

router.run