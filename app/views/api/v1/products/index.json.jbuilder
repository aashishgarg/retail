json.products @products do |product|
  json.id do
    json.name product.name
    json.images ''#products.name
  end
end