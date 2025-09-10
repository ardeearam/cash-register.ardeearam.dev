json.products @products do |product|
  json.extract! product, :id, :name, :code
end