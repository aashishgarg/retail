json.products @products do |product|
  json.id do
    json.name product.name
    json.images product.images.collect{|x| Rails.application.routes.url_helpers.rails_blob_path(x, only_path: true)}
  end
end