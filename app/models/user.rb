class User < ApplicationRecord

  #Encrypt password
  has_secure_password

  has_many :assignments, dependent: :destroy
  has_many :roles, through: :assignments, dependent: :destroy

  has_many :user_cards, dependent: :destroy
  has_many :club_cards, through: :user_cards, dependent: :destroy

  has_many :product_reviews
  has_many :carts

  validates_presence_of :cedula, :nombres, :apellidos, :email, :password_digest
  validates :cedula, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def role?(role)

    roles.any? { |r| r.name.underscore.to_sym == role }

  end

  # true if the user is premium
  def premium?
    premium
  end

end
