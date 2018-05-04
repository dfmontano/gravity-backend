class AddUserToProductReview < ActiveRecord::Migration[5.2]
  def change
    add_reference :product_reviews, :user, foreign_key: true
  end
end
