class OpenWeatherService
  def self.get_weather_data(lat, lng)
    response = conn.get("/data/2.5/onecall?lat=#{lat}&appid=#{ENV["WEATHER_KEY"]}&lon=#{lng}&units=imperial")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    @conn ||= Faraday.new(url: 'https://api.openweathermap.org')
  end
end