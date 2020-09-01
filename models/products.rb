class Product
  attr_accessor :uuid, :name, :price

  def initialize(uuid, name, price)
    @uuid = uuid
    @name = name
    @price = price
  end
end