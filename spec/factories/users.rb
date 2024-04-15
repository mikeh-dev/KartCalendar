FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    role { '' }

    trait :admin do
      email { 'mike@admin.com' }
      first_name { 'Mike' }
      last_name { 'Howard' }
      admin { true }
    end
  end
end