class User < ApplicationRecord
  validates :name, presence: true

  scope :team,        ->(user){ where(parent_id: user.id) }
end
