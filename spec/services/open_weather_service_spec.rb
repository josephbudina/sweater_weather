require 'rails_helper'

RSpec.describe OpenWeatherService, type: :model do

  describe "#get_data" do
    it "should return json for for open weather api", :vcr do
      result = OpenWeatherService.get_weather_data(39.738453, -104.984853)

      expect(result.class).to eq(Hash)
      expect(result).to have_key(:lat)
      expect(result).to have_key(:lon)
      expect(result).to have_key(:timezone)
      expect(result).to have_key(:timezone_offset)
      expect(result).to have_key(:current)
      expect(result[:current]).to have_key(:dt)
    end
  end
end