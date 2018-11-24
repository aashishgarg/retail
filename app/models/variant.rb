class Variant < ApplicationRecord
  # --- Associations --- #
  belongs_to :products, inverse_of: :variants
  has_and_belongs_to_many :attribute_choices

  def self.search(chars)
    chars.present? ? where('name like (?)', "%#{chars}%") : all
  end
end
