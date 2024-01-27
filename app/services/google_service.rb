require 'net/http'
require 'json'

class GoogleService
  BASE_URL = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json'
  API_KEY = ENV['GOOGLE_MAPS_API_KEY']

  def self.fetch_nearby_hotels(latitude, longitude, limit: 5)
    uri = URI(BASE_URL)
    params = {
      location: "#{latitude},#{longitude}",
      radius: 5000, # Meters
      type: 'Hotel', # Use 'lodging' for hotels
      key: API_KEY
    }
    uri.query = URI.encode_www_form(params)

    response = Net::HTTP.get(uri)
    results = JSON.parse(response)['results']

    # Limiting the results to the specified limit
    limited_results = results.first(limit)
    { 'results' => limited_results }
  end
end
