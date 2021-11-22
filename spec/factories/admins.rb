FactoryBot.define do
  factory :admin do
    login { "Max" }
    email { "exemple@dot.net" }
    password { "123456" }
  end
end
