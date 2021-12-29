FactoryBot.define do
  factory :category do

    name { Faker::Company.name }

    trait :helth do
      name { Category::NAMES[3] }
    end

    trait :feed do
      name { Category::NAMES[5] }
    end

    trait :secure do
      name { Category::NAMES[6] }
    end

    trait :add do
      name { Category::NAMES[9] }
    end

    trait :emergency do
      name { Category::NAMES[1] }
    end

  end
end
