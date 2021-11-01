FactoryBot.define do
  factory :shop do
    name { Faker::Lorem.word }
    prefecture { 40 }
    address { Faker::Lorem.word }
    user
  end
end
