json.basket do
  json.extract! @basket, :id, :total_price
  json.product_items @basket.product_items.includes(:product).order(:id) do |item|
    json.extract! item, :id, :price_with_discount, :product_id
    json.product_code item.product.code
  end
end
