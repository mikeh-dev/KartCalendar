FactoryBot.define do
  factory :service_record do
    association :user
    association :engine
    date { Date.today }
    description { "Regular service and maintenance." }
    engine_builder { "Top Engine Builders Inc." }
    notes { "Everything checked and verified. Ready for the next race." }

    after(:build) do |service_record|
      # Adjust paths and filenames as necessary
      invoice_path = Rails.root.join('spec', 'fixtures', 'files', 'test_image.jpg')
      dyno_sheet_path = Rails.root.join('spec', 'fixtures', 'files', 'test_image.jpg')

      service_record.invoice.attach(
        io: File.open(invoice_path),
        filename: 'test_image.jpg',
        content_type: 'application/pdf'
      )

      service_record.dyno_sheets.attach(
        io: File.open(dyno_sheet_path),
        filename: 'test_image.jpg',
        content_type: 'image/jpeg'
      )
      # Attach more dyno_sheets if necessary
    end
  end
end