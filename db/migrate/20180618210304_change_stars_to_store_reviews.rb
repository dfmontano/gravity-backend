class ChangeStarsToStoreReviews < ActiveRecord::Migration[5.2]
  def change
    change_column :store_reviews, :stars, :decimal, :precision => 2, :scale => 1
  end
end
