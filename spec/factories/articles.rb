FactoryBot.define do
  factory :article do
    description { Article::DESCRIPTION }
    published_at { Time.zone.now + 10.minutes }
    title { Article::TITLE.sample}
    image { Rack::Test::UploadedFile.new("spec/files/articles/#{rand(1..4)}.png", 'image/png') }

    category
  end
end
