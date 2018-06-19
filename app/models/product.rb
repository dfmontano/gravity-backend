class Product < ApplicationRecord

  after_find :available?
  after_find :average_rating
  after_find :reviews
  # after_find :premium_discount

  belongs_to :category
  belongs_to :subcategory
  belongs_to :store

  has_many :product_reviews, dependent: :destroy
  has_many :cart_products

  attr_accessor :available, :discount_price, :rating, :reviews

  mount_base64_uploader :images, ImageUploader

  # true if product stock is mayor than 0
  def available?
    if self.stock == 0 || self.stock < 1
      self.available = false
      false
    elsif stock > 0
      self.available = true
      true
    end
  end

  def discount_price
    self.discount_price = self.price - self.price * self.discount / 100
  end

  def average_rating
    if self.product_reviews.size > 0
      self.rating = self.product_reviews.average(:stars)
    else
      self.rating = 0
    end
  end

  def reviews
    if self.product_reviews.count > 0
      self.reviews = self.product_reviews.count
    else
      self.reviews = 0
    end
  end

  # Check if user is premium and sets discount_price
  # def premium_discount
  #   if current_user.premium?
  #     discount_percent = self.discount / 100
  #     self.discount_price = self.price - self.price * discount_percent
  #   else
  #     self.discount_price = self.price
  #   end
  # end

end
