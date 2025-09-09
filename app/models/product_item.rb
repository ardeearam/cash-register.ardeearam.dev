class ProductItem < ApplicationRecord
  belongs_to :product

  attr_writer :price_with_discount

  def price_with_discount
    @price_with_discount || product.price
  end
end
