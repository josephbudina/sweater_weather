class OpenWeather
  attr_reader :id,
              :weather_data

  def initialize(data)
    @id = nil
    @weather_data = data
  end

  def self.weather_objects(lat, lng)
    weather = OpenWeatherService.get_weather_data(lat, lng)
    OpenWeather.new(weather)
  end
end