FactoryBot.define do
  factory :track do
    name { "Sample Track" }
    address { Faker::Address.full_address }
    contact_number { Faker::PhoneNumber.phone_number }
    length { rand(1000..5000) } 
    email { Faker::Internet.email }
    description { Faker::Lorem.paragraph }
    location { Faker::Address.city }
    short_desc { Faker::Lorem.sentence }
    website { Faker::Internet.domain_name }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end