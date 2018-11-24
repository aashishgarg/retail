class ProductAttributesProductsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :product_attributes_classes, id: false do |t|
      t.references :product_attribute, null: false
      t.references :product_class, null: false
    end

    create_table :attribute_choices_variants, id: false do |t|
      t.references :attribute_choice, null: false
      t.references :variant, null: false
    end
  end
end
