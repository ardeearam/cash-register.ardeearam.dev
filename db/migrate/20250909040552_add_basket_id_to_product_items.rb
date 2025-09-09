class AddBasketIdToProductItems < ActiveRecord::Migration[8.0]
  def change
    add_reference :product_items, :basket, null: false
  end
end
