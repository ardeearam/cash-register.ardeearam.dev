class Basket < ApplicationRecord
  extend CollectionRuleManager  
  has_many :product_items

  #Declare pricing rules here

  add_rule :buy_one_get_one_green_tea do |product_items|
    take_one = false
    green_tea_product_items = product_items.joins(:product).where(product:{code: "GR1"})
    green_tea_product_items.each do |product_item|
      product = product_item.product
      if take_one 
        product_item.price_with_discount = 0
        product_item.save!
        take_one = false
      else  
        #Next one is free
        take_one = true
      end
    end
  end

  add_rule :bulk_discount_for_strawberries do |product_items|
    strawberry_product_items = product_items.joins(:product).where(product:{code: "SR1"})
    if strawberry_product_items.count >= 3
      strawberry_product_items.update_all(price_with_discount: 4.50)
    end
  end

  add_rule :bulk_discount_for_coffee_two_thirds do |product_items|
    coffee_product_items = product_items.joins(:product).where(product:{code: "CF1"})
    if coffee_product_items.count >= 3
      #Intermediate results: 4 decimal places
      coffee_product_items.update_all(price_with_discount: ((BigDecimal(coffee_product_items.first.product.price.to_s) * 2) / 3).round(4))
    end
  end


  def add(product)
    product_items << ProductItem.new(product: product, basket: self, price_with_discount: product.price)
  end

  def total_price

    self.class.rules.each do |rule|
      rule.call(product_items)
    end

    #Final result: 2 decimal places
    product_items.sum{|item| BigDecimal(item.price_with_discount.to_s)}.round(2)
  end
end
