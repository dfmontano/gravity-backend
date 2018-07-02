class Store < ApplicationRecord

  after_find :average_rating

  has_many :products
  has_many :store_reviews

  belongs_to :category
  belongs_to :subcategory

  mount_uploader :logo, ImageUploader
  mount_uploader :cover, ImageUploader
  mount_uploader :owner_photo, ImageUploader

  # has_many_attached :images

  attr_accessor :rating, :total_products

  def average_rating
    if self.store_reviews.size > 0
      self.rating = self.store_reviews.average(:stars)
    else
      self.rating = 0
    end
  end

  def total_products
    if self.products.size > 0
      self.total_products = self.products.count
    else
      self.total_products = 0
    end
  end

end
