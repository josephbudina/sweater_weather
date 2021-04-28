require 'rails_helper'

RSpec.describe 'Forecast' do

  describe 'Forecast poro' do
    it '#new_forecast', :vcr do
      weather = {
        current_weather: ForecastsFacade.current_weather("denver,co"),
        daily_weather: ForecastsFacade.daily_weather("denver,co"),
        hourly_weather: ForecastsFacade.hourly_weather("denver,co")
      }
      forecast = Forecast.new(weather)
      expect(forecast.current_weather.size).to eq(10)
      expect(forecast.current_weather.keys).to eq([:datetime, :sunrise, :sunset, :temperature, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon])
      expect(forecast.daily_weather.size).to eq(5)
      expect(forecast.daily_weather[0].keys).to eq([:date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon])
      expect(forecast.hourly_weather.size).to eq(8)
      expect(forecast.hourly_weather[0].keys).to eq([:time, :temp, :conditions, :icon])
    end
  end
end