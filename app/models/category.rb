class Category < ApplicationRecord

  NAMES = ["Перший досвід", " Екстрене", "Розвиток дитини", "Здоров'я",
          "Здоров'я матері", "Годування", "Безпека", "Активності з дитиною",
          "Життя батьків", "Додатково"]

  has_many :articles, dependent: :destroy

  scope :ordered_by_name, ->{ order(:name) }

  validates :name, presence: true, uniqueness: true, inclusion: { in: NAMES }
end
