class Product < ApplicationRecord
  # --- Associations ---- #
  belongs_to :product_class, inverse_of: :products, dependent: :destroy
  has_many :product_attributes, through: :product_class
  has_many :variants, inverse_of: :product, dependent: :destroy

  # --- Callbacks --- #
  after_commit :create_product_variants

  # --- Instance methods --- #
  def type
    product_class.name
  end

  private

  def create_product_variants
    if product_class.product_attributes.present?
      collection = product_attributes.collect { |x| x.attribute_choices }
      collection.collect!(&:to_a)
      pairs = collection[0].product(*collection[1..-1])
      pairs.each do |pair|
        variant_name = ''
        variant_name << name
        pair.each{|attr| variant_name << " #{attr.product_attribute.name}:#{attr.name}"}
        variant = variants.create(name: variant_name, sku: 'sku1')
        variant.attribute_choices << pair
      end
    else
      variants.create(name: name, sku: 'sku2')
    end
  end
end
