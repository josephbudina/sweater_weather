require 'rails_helper'

RSpec.describe 'OpenWeather' do

  describe 'OpenWeather poro' do
    it '#weather_objects', :vcr do
      weather = OpenWeather.weather_objects(38.265427, -104.605087)

      expect(weather.id).to eq(nil)
      expect(weather.weather_data[:lat]).to eq(38.2654)
      expect(weather.weather_data[:lon]).to eq(-104.6051)
      expect(weather.weather_data.keys).to eq([:lat, :lon, :timezone, :timezone_offset, :current, :minutely, :hourly, :daily])
    end
  end
end