json.primary_product do
  json.id @product.id
  json.name @product.name
  json.images []
end

json.attributes @product.product_class.product_attributes do |attr|
  json.id attr.id
  json.name attr.name
end

json.options @product.product_class.product_attributes.collect(&:attribute_choices).flatten do |attr_choice|
  json.id attr_choice.id
  json.attrib_id attr_choice.product_attribute.id
  json.name attr_choice.name
end

json.product_variations @product.variants do |product|
  json.name product.name
  json.images product.images.collect{|x| Rails.application.routes.url_helpers.rails_blob_path(x, only_path: true)}
end