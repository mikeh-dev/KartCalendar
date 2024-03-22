FactoryBot.define do
  factory :event do
    title { "Sample Event" }
    description { Faker::Lorem.paragraph }
    start_date { Date.today }
    end_date { Date.tomorrow }
    price { rand(1000..5000) }
    event_type { "Race" }
    track { FactoryBot.create(:track) }
    championship { FactoryBot.create(:championship) }
    licence { "MSUK Licence" }
  end
end