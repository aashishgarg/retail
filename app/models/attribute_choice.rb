class AttributeChoice < ApplicationRecord
  # --- Associations ---- #
  belongs_to :product_attribute, inverse_of: :attribute_choices
  has_and_belongs_to_many :variants

  # --- Validations --- #
  validates :name, presence: true, length: {minimum: 2}
end
