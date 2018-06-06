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

  mount_base64_uploader :avatar, AvatarUploader

  def role?(role)

    roles.any? { |r| r.name.underscore.to_sym == role }

  end

  # true if the user is premium
  def premium?
    premium
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.forgot_password(self).deliver
  end

  def send_welcome
    UserMailer.welcome(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
