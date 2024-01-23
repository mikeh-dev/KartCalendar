require 'csv'

namespace :csv_import do
  desc "Import events from a CSV file"
  task events: :environment do
    file_path = 'lib/data/sampleevents.csv' 

    events = []

    CSV.foreach(file_path, headers: true, header_converters: :symbol) do |row|
      start_date = parse_date(row[:start_date])
      end_date = parse_date(row[:end_date])

      event = Event.new(
        title: row[:title],
        description: row[:description],
        price: row[:price],
        event_type: row[:event_type],
        championship_id: row[:championship_id],
        track_id: row[:track_id],
        start_date: start_date,
        end_date: end_date
      )

      if event.valid?
        events << event
      else
        puts "Invalid event data: #{event.errors.full_messages}"
      end
    end

    if events.empty?
      puts "No events to import"
    else
      Event.import(events)
      puts "#{events.size} events imported"
    end
  end
end

def parse_date(date_string)
  return nil if date_string.blank?

  date = Date.strptime(date_string, '%d/%m/%Y') rescue nil

  date && date.year < 2000 ? date.change(year: date.year + 2000) : date
end
