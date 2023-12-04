FactoryBot.define do
  factory :event do
    title { "Sample Event" }
    description { Faker::Lorem.paragraph }
    date { "1/1/24"}
    price { rand(1000..5000) }
    event_type { "Race" }
    track
  end
end