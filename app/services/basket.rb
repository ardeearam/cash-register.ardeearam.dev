class Basket
  extend CollectionRuleManager
  attr_reader :product_items

  #Declare pricing rules here
  
  add_rule :buy_one_get_one_green_tea do |product_items|
    take_one = false
    product_items.each do |product_item|
      product = product_item.product
      next if product.code != "GR1"
      if take_one 
        product_item.price_with_discount = 0
        take_one = false
      else  
        #Next one is free
        take_one = true
      end
    end
  end



  def initialize
    @product_items = []
  end

  def add(product)
    product_item = ProductItem.create!(product: product)
    product_items << product_item
  end

  def total_price

    self.class.rules.each do |rule|
      rule.call(product_items)
    end


    product_items.sum(&:price_with_discount)
  end
end
