class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.references :category, foreign_key: true
      t.references :subcategory, foreign_key: true
      t.string :sku
      t.integer :stock
      t.decimal :price
      t.integer :discount
      t.integer :visits

      t.timestamps
    end
  end
end
