FactoryBot.define do

  factory :engine do
    engine_number { "0987" }
    engine_make { "Rotax" }
    engine_model { "Max" }
    barrel_number { "1234" }
    seal_number { "5678" }
    year_manufactured { 2021 }
  end
end