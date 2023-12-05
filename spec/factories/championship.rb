FactoryBot.define do
  factory :championship do
    name { "Championship #{rand(1000)}" }
    price { rand(1000) }
    description { Faker::Lorem.paragraph }
    short_name { "Short Name #{rand(1000)}" }
    long_name { "Long Name #{rand(1000)}" }
  end
end