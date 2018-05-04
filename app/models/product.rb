class Product < ApplicationRecord
  belongs_to :category
  belongs_to :subcategory
  belongs_to :store

  has_many :product_reviews

end
