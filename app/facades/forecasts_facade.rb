class ForecastsFacade

  def self.lat_lng(location)
    geo = GeocodeService.get_geocode_data(location)[:results][0][:locations][0][:latLng]
  end

  def self.forecast_object(location)
    weather = {
      current_weather: current_weather(location),
      daily_weather: daily_weather(location),
      hourly_weather: hourly_weather(location)
    }

    Forecast.new(weather)
  end

  def self.current_weather(location)
    geo = GeocodeService.get_geocode_data(location)[:results][0][:locations][0][:latLng]
    weather = OpenWeather.weather_objects(geo[:lat], geo[:lng])

    current_weather = {
      datetime: Time.at(weather.weather_data[:current][:dt]),
      sunrise: Time.at(weather.weather_data[:current][:sunrise]),
      sunset: Time.at(weather.weather_data[:current][:sunset]),
      sunset: Time.at(weather.weather_data[:current][:sunset]),
      temperature: weather.weather_data[:current][:temp],
      feels_like: weather.weather_data[:current][:feels_like],
      humidity: weather.weather_data[:current][:humidity],
      uvi: weather.weather_data[:current][:uvi],
      visibility: weather.weather_data[:current][:visibility],
      conditions: weather.weather_data[:current][:weather][0][:description],
      icon: weather.weather_data[:current][:weather][0][:icon]
    }
  end

  def self.daily_weather(location)
    geo = GeocodeService.get_geocode_data(location)[:results][0][:locations][0][:latLng]
    weather = OpenWeather.weather_objects(geo[:lat], geo[:lng])

    daily_weather = weather.weather_data[:daily][0..4].map do |day|
      days = {
        date: Time.at(day[:dt]).to_date,
        sunrise: Time.at(day[:sunrise]),
        sunset: Time.at(day[:sunset]),
        max_temp: day[:temp][:max],
        min_temp: day[:temp][:min],
        conditions: day[:weather][0][:description],
        icon: day[:weather][0][:icon]
      }
    end
  end

  def self.hourly_weather(location)
    geo = GeocodeService.get_geocode_data(location)[:results][0][:locations][0][:latLng]
    weather = OpenWeather.weather_objects(geo[:lat], geo[:lng])

    hourly_weather = weather.weather_data[:hourly][0..7].map do |day|
      hours = {
        time: Time.at(day[:dt]).to_s(:time),
        temp: day[:temp],
        conditions: day[:weather][0][:description],
        icon: day[:weather][0][:icon]
      }
    end
  end
end