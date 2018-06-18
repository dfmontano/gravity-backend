class ChangeStarsToProductReviews < ActiveRecord::Migration[5.2]
  def change
    change_column :product_reviews, :stars, :decimal, :precision => 2, :scale => 1
  end
end
