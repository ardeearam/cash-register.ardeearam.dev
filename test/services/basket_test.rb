require "test_helper"

class BasketTest < ActiveSupport::TestCase

  def test_calculates_total_price


     gr1 = Product.create(code: "GR1", name: "Green Tea", price: 3.11)
     sr1 = Product.create(code: "SR1", name: "Strawberries", price: 5.00)
     cf1 = Product.create(code: "CF1", name: "Coffee", price: 11.23)


     [
      #{contents: [gr1, sr1, gr1, gr1, cf1], expected_price: 22.45},
      {contents: [gr1, gr1], expected_price: 3.11},
      #{contents: [sr1, sr1, gr1, sr1], expected_price: 16.61},
      #{contents: [gr1, cf1, sr1, cf1, cf1], expected_price: 30.57}
     ].each do |basket_expectation|

        basket = Basket.new
        basket_expectation[:contents].each{|product| basket.add(product)}
        assert_equal basket_expectation[:expected_price], basket.total_price

     end



  end
end
