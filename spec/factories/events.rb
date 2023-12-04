FactoryBot.define do
  factory :event do
    title { "Sample Event" }
    description { Faker::Lorem.paragraph }
    date { "1/1/24"}
  end
end