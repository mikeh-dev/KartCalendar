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

  def parsed_weather_forecast(longitude, latitude)
    response = forecast_by_lat_lon(longitude, latitude)
    weather_data = response.parsed_response

    if weather_data['list']
      weather_data['list'].group_by { |entry| entry['dt_txt'].to_date }
    else
      {}
    end
  end
end
