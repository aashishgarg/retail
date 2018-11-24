class ProductAttribute < ApplicationRecord
  # --- Associations ---- #
  has_many :attribute_choices, inverse_of: :product_attribute, dependent: :destroy
  has_and_belongs_to_many :product_classes
  has_many :products, through: :product_classes

  # --- Validations --- #
end
