class ProductAttributesProductsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :product_attributes_products, id: false do |t|
      t.integer :product_id, null: false
      t.integer :product_attribute_id, null: false
    end

    create_table :product_classes_product_attributes, id: false do |t|
      t.integer :product_class_id, null: false
      t.integer :product_attribute_id, null: false
    end

    create_table :attribute_choices_variants, id: false do |t|
      t.references :attribute_choice, null: false
      t.references :variant, null: false
    end

  end
end
