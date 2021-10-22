FactoryBot.define do
  factory :article do
    description { Article::DESCRIPTION }
    published_at { Time.zone.now + 10.minutes }

    trait :title do
      title { Article::TITLE[rand(0..3)]}
    end

    category

    trait :with_image do
      image { Rack::Test::UploadedFile.new(Rails.root + "spec/files/articles/#{rand(1..4)}.png", 'image/png') }
    end
  end
end
