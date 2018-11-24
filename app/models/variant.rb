class Variant < ApplicationRecord
  # --- Associations --- #
  belongs_to :product, inverse_of: :variants
  has_and_belongs_to_many :attribute_choices
end
