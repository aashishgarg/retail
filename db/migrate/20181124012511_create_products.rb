class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :product_class, foreign_key: true
      t.string :name
      t.timestamps
    end
  end
end
