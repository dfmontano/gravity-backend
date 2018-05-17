class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :stores

  validates_presence_of :name
end
