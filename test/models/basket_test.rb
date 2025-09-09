require "test_helper"

class BasketTest < ActiveSupport::TestCase

  setup do
    @gr1 = Product.create!(code: "GR1", name: "Green Tea", price: 3.11)
    @sr1 = Product.create!(code: "SR1", name: "Strawberries", price: 5.00)
    @cf1 = Product.create!(code: "CF1", name: "Coffee", price: 11.23)
  end

  test "#total_price must match expected values" do

     [
      {contents: [@gr1, @sr1, @gr1, @gr1, @cf1], expected_price: 22.45},
      {contents: [@gr1, @gr1], expected_price: 3.11},
      {contents: [@sr1, @sr1, @gr1, @sr1], expected_price: 16.61},
      {contents: [@gr1, @cf1, @sr1, @cf1, @cf1], expected_price: 30.57}
     ].each do |basket_expectation|

        basket = Basket.create!
        basket_expectation[:contents].each{|product| basket.add(product)}
        assert_equal basket_expectation[:expected_price], basket.total_price
     end

  end

  #In preparation for the subtotals to persist between API calls
  test "#total_price can be invoked multiple times with correct subtotals and totals" do
    basket = Basket.create!
    basket_id = basket.id

    basket.add(@gr1)
    assert_equal 3.11, basket.total_price

    basket = Basket.find(basket_id)
    basket.add(@cf1)
    assert_equal 14.34, basket.total_price
  end
end
