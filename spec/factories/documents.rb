FactoryBot.define do
  factory :document do
    title { Faker::Company.name }
    file{ Rack::Test::UploadedFile.new("spec/files/documents/2.png") }
  end
end
