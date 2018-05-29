class Store < ApplicationRecord

  has_many :products
  has_many :store_reviews

  belongs_to :category
  belongs_to :subcategory

  has_many_attached :images

end
