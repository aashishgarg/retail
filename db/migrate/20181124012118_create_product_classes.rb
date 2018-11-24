class CreateProductClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :product_classes do |t|
      t.string :name

      t.timestamps
    end
  end
end
