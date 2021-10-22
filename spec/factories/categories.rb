FactoryBot.define do
  factory :category do
    name {Category::NAME.each}
  end
end
