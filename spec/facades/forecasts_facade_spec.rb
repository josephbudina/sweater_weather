require 'rails_helper'

RSpec.describe ForecastsFacade, type: :model do

  describe "#lat_lng" do
    it "should get langitude and latitude", :vcr do
      result = ForecastsFacade.lat_lng("denver,co")

      expect(result.class).to eq(Hash)
      expect(result[:lat].class).to eq(Float)
      expect(result[:lat]).to eq(39.738453)
      expect(result[:lng]).to eq(-104.984853)
    end

    it "should find current weather", :vcr do
      result = ForecastsFacade.current_weather("denver,co")

      expect(result.class).to eq(Hash)
      expect(result.keys).to eq([:datetime, :sunrise, :sunset, :temperature, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon])
    end

    it "should find daily weather", :vcr do
      result = ForecastsFacade.daily_weather("denver,co")

      expect(result.class).to eq(Array)
      expect(result.size).to eq(5)
      expect(result[0].keys).to eq([:date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon])
    end

    it "should find hourly", :vcr do
      result = ForecastsFacade.hourly_weather("denver,co")

      expect(result.class).to eq(Array)
      expect(result.size).to eq(8)
      expect(result[0].keys).to eq([:time, :temp, :conditions, :icon])
    end

    it "should find forecast object", :vcr do
      result = ForecastsFacade.forecast_object("denver,co")

      expect(result.class).to eq(Forecast)
      expect(result.current_weather.class).to eq(Hash)
      expect(result.daily_weather.class).to eq(Array)
      expect(result.hourly_weather.class).to eq(Array)
    end
  end
end