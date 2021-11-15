FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    password { "password" }
    email { Faker::Internet.unique.email }
    self_introduction { "こんにちは" }
  end
end
