FactoryBot.define do
  factory :engine do
    association :user
    engine_number { "EN#{rand(1000..9999)}" } # Unique engine number
    engine_make { ["MakeA", "MakeB", "MakeC"].sample } # Example engine makes
    engine_model { "Model#{rand(1..5)}" } # Example engine models
    barrel_number { "BN#{rand(100..999)}" }
    seal_number { "SN#{rand(1000..9999)}" }
    year_manufactured { rand(1990..2020).to_s }
    name { "Engine #{rand(1..100)}" }
    notes { "Some notes about the engine." }
  end
end
