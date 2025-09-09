class AddPriceWithDiscountToProductItems < ActiveRecord::Migration[8.0]
  def change
    add_column :product_items, :price_with_discount, :decimal
  end
end
