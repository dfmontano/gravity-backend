class Product < ApplicationRecord

  after_find :available?
  # after_find :premium_discount

  belongs_to :category
  belongs_to :subcategory
  belongs_to :store

  has_many :product_reviews, dependent: :destroy
  has_many :cart_products

  attr_accessor :available, :discount_price

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
