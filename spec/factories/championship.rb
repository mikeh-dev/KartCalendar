FactoryBot.define do
  factory :championship do
    name { "Championship #{rand(1000)}" }
    price { rand(1000) }
    description { Faker::Lorem.paragraph } 
  end
end
