class Article < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  mount_uploader :image, ArticleUploader

  AGE = ["0-3 місяці", "3-6 місяців", "6-9 місяців",
        "9-12 місяців", "12-18 місяців", "18-24 місяці", "2-3 роки", "3-4 роки",
        "4-5 роки", "5-6 роки"]

  SUBJECT = ["Вакцинація", "Візит до лікаря", "Годування",
            "Здоров'я", "Купання", "Підгузок", "Прогулянка", "Сон"]

  TITLE = ["Як виробити режим сну у дитини",
          "Чого очікувати у перші тижні з дитиною",
          "Як зрозуміти що ваша дитина правильно розвивається",
          "10 причин чому ваша дитина погано спить"]

  DESCRIPTION = "Щоб ваша дитина виросла здоровою і добре розвивалася,
    привчайте її до певного розпорядку дня. Регулярне годування – основа режиму
    немовляти. Годуйте новонародженого до 3-х місяців (включно) сім разів на добу
    через 3 години. Після 3-х місячного віку переходьте на годування через 3,5
    години (6 разів) з перервою вночі 6,5 годин. З 5-6-ти місячного віку годуєте
    дитину п’ять разів на день через 4 години, з перервою на ніч – 8 годин.
    Після ситного обіду новонароджена дитина має не спати близько півгодини,
    двомісячна – близько години. Для сну дитині потрібне свіже і прохолодне
    повітря, тому необхідно провітрювати його кімнату.
    З трьохмісячного, до десятимісячного віку малюк повинен спати по 2 години
    три рази на день, а з 10 місяців і до року – по 2-2,5 години два рази на
    день.
    Крім провітрювання, дитині необхідні свіже повітря і сонячне світло.
    Вона повинна проводити на свіжому повітрі декілька годин, і поки вона не
    може ходити, укладайте її спати вдень на свіжому повітрі – це зміцнить її
    організм і застереже від захворювань .
    Прогулянки починайте з двотижневого віку протягом 15-20 хвилин, поступово
    подовжуючи час прогулянок до 1,5-2 годин."

  # belongs_to :author
  belongs_to :category

  scope :published,        ->{ where('published_at <= ?', Time.zone.now) }

  scope :title,            ->(search) {where('LOWER(title) LIKE ?', "%#{search[:title]}%")}
  scope :age,            ->(search) {where(age: search[:age])}
  scope :subject,            ->(search) {where(subject: search[:subject])}

  validates :title, :description, :age, :subject, presence: true

  def published?
    published_at.present? && published_at <= Time.zone.now
  end

  def self.search(search)
    if search
      articles = self
      articles = articles.title(search) if search[:title]
      articles = articles.age(search) if search[:age]
      articles = articles.subject(search) if search[:subject]
      articles
    else
      all
    end
  end

  index_name [Rails.env, model_name.collection.gsub(/\//, '-')].join('_')
end
