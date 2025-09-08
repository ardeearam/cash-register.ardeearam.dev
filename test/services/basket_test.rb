require "test_helper"

class BasketTest < ActiveSupport::TestCase

  def test_calculates_total_price
     gr1 = products(:GR1)
     sr1 = products(:SR1)
     cf1 = products(:CF1)


     [
      {contents: [gr1, sr1, gr1, gr1, cf1], expected_price: 22.45},
      {contents: [gr1, gr1], expected_price: 3.11},
      {contents: [sr1, sr1, gr1, sr1], expected_price: 16.61},
      {contents: [gr1, cf1, sr1, cf1, cf1], expected_price: 30.57}
     ].each do |basket_expectation|

        basket = Basket.new
        basket_expectation[:contents].each{|product| basket.add(product)}
        assert_equal basket_expectation[:expected_price], basket.total_price

     end



  end
end
