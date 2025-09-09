class CreateBaskets < ActiveRecord::Migration[8.0]
  def change
    create_table :baskets do |t|
      t.references :product_items, null: false, foreign_key: true

      t.timestamps
    end
  end
end
