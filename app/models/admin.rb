class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  validates :login, presence: true
  attr_accessor :skip_password_validation

  def self.from_omniauth(auth)
    data = auth.info
    google_admin = Admin.where(email: data['email']).first

    unless google_admin
        google_admin = Admin.create(login: data['name'],
           email: data['email'],
           password: Devise.friendly_token[0,20]
        )
    end
    google_admin
  end

  private

  def password_required?
    return false if skip_password_validation
    super
  end
end
