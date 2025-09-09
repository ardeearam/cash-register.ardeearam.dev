class RemoveForeignKeyFromProductItems < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :product_items, :products
  end
end
