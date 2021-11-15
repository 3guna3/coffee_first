FactoryBot.define do
  factory :beans_comment do
    content { Faker::Lorem.word }
    bitterness { rand(1..5) }
    acidity { rand(1..5) }
    body { rand(1..5) }
    user
    bean
  end
end
