class Basket
  attr_reader :products

  def initialize
    @products = []
  end

  def add(product)
    products << product
  end

  def total_price
    #Initial implementation without the cases
    #bound to fail
    products.sum(&:price)
  end
end
