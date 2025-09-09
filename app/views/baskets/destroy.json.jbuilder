json.basket do
  json.extract! @basket, :id, :product_items, :total_price
end