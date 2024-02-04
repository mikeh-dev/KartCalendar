namespace :geocode do
  desc "Geocode all tracks"
  task tracks: :environment do
    Track.find_each do |track|
      if track.geocode
        puts "Geocoded #{track.name}"
        track.save
      else
        puts "Geocoding failed for #{track.name}"
      end
    end
  end
end