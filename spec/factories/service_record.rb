FactoryBot.define do
  factory :service_record do
    association :user
    association :engine
    date { Date.today }
    description { "Regular service and maintenance." }
    engine_builder { "Top Engine Builders Inc." }
    notes { "Everything checked and verified. Ready for the next race." }
  end
end