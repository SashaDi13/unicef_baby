class User < ApplicationRecord
  validates :name, presence: true
  validate :managers

  def self.team(user)
    self.where(parent_id: user.id)
  end

  def managers
    managers = []
    user = self
    while !user.parent_id.nil? do
      managers << user
      user = User.find(user.parent_id)
    end
    managers << user
  end
end
