class Category < ApplicationRecord

  has_many :subcategories
  has_many :stores

  validates_presence_of :name

end
