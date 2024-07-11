class WeatherService
  include HTTParty
  base_uri 'https://api.openweathermap.org/data/2.5'


  def initialize(api_key = ENV['OPENWEATHERMAP_API_KEY'])
    @api_key = api_key
  end

  def forecast_by_lat_lon(longitude, latitude)
    options = { query: { lat: latitude, lon: longitude, appid: @api_key, units: 'metric' } }
    self.class.get('/forecast', options)
  end
end