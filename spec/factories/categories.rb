FactoryBot.define do
  factory :category do
    trait :name do
      name {Category::NAME[rand(0..9)] }
    end
  end
end
