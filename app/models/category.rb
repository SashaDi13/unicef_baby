class Category < ApplicationRecord

  NAMES = ["Перший досвід", "Екстрене", "Розвиток дитини", "Здоров'я",
          "Здоров'я матері", "Годування", "Безпека", "Активності з дитиною",
          "Життя батьків", "Додатково"]

  has_many :articles, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
