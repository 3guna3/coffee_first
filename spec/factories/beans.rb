FactoryBot.define do
  factory :bean do
    name { Faker::Lorem.word }
    country { 50 }
    price { rand(1000) }
    user
    shop
  end
end
