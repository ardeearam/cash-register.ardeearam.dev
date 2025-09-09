class RemoveProductItemsIdFromBaskets < ActiveRecord::Migration[8.0]
  def change
    remove_column :baskets, :product_items_id
  end
end
