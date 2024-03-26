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

    after(:build) do |engine|
      # Attach engine photos
      2.times do
        engine.engine_photos.attach(io: File.open('spec/fixtures/files/test_image.jpg'), filename: 'engine_photo.jpg', content_type: 'image/jpeg')
      end

      # Attach dyno sheet
      engine.dyno_sheet.attach(io: File.open('spec/fixtures/files/test_image.jpg'), filename: 'dyno_sheet.jpg', content_type: 'image/jpeg')

      # Attach logbook cover
      engine.logbook_cover.attach(io: File.open('spec/fixtures/files/test_image.jpg'), filename: 'logbook_cover.jpg', content_type: 'image/jpeg')
    end
  end
end
