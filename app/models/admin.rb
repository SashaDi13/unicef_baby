class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google]
  validates :login, presence: true
  attr_accessor :skip_password_validation

  def self.from_omniauth(auth)
    Admin.where(email: auth.info['email']).first_or_create do |admin|
      admin.login = auth.info['name'],
      admin.email = auth.info['email'],
      admin.password = Devise.friendly_token[0,20]
    end
  end

  private

  def password_required?
    return false if skip_password_validation
    super
  end
end
