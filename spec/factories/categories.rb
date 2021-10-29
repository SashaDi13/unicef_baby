FactoryBot.define do
  factory :category do
    name { Category::NAMES.sample }
  end
end
