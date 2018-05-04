class CreateProductReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :product_reviews do |t|
      t.integer :stars
      t.text :comment
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
