class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
  validates :login, presence: true

  def self.from_omniauth(auth)
    google_admin = Admin.find_or_initialize_by(email: auth.info.email)
    google_admin
  end

  private

  def password_required?
    return false if skip_password_validation
    super
  end
end
