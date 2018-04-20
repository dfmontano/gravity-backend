class User < ApplicationRecord

  #Encrypt password
  has_secure_password

  has_many :assignments
  has_many :roles, through: :assignments

  has_many :user_cards
  has_many :club_cards, through: :user_cards

  validates_presence_of :cedula, :nombres, :apellidos, :email, :password_digest
  validates :cedula, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def role?(role)

    roles.any? { |r| r.name.underscore.to_sym == role }

  end

end
