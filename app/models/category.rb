class Category < ApplicationRecord

  has_many :articles, dependent: :destroy

  scope :ordered_by_name, ->{ order(:name) }

  validates :name, presence: true, uniqueness: true

  NAME = ["Перший досвід", " Екстрене", "Розвиток дитини", "Здоров'я",
          "Здоров'я матері", "Годування", "Безпека", "Активності з дитиною",
          "Життя батьків", "Додатково"]
end
