class MapboxService
  include HTTParty
  base_uri 'https://api.mapbox.com/geocoding/v5/mapbox.places'

  def initialize(api_key = ENV['MAPBOX_ACCESS_TOKEN'])
    @api_key = api_key
  end

  def search_category(longitude, latitude, category)
    options = { query: { proximity: "#{longitude},#{latitude}", access_token: @api_key, limit: 5 } }
    self.class.get("/#{category}.json", options)
  end

  def fetch_hotels(longitude, latitude)
    hotel_response = search_category(longitude, latitude, 'hotel')
    JSON.parse(hotel_response.body) if hotel_response
  end
  
  def fetch_fuel_stations(longitude, latitude)
    fuel_response = search_category(longitude, latitude, 'fuel')
    JSON.parse(fuel_response.body) if fuel_response
  end
end