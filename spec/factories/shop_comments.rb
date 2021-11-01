FactoryBot.define do
  factory :shop_comment do
    content { Faker::Lorem.word }
    rate { rand(1..5) }
    user
    shop
  end
end
