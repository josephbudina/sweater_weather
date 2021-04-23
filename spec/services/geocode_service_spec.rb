require 'rails_helper'

RSpec.describe GeocodeService, type: :model do

  describe "#get_data" do
    it "should return json for for geocode api", :vcr do
      result = GeocodeService.get_geocode_data("denver,co")

      expect(result.class).to eq(Hash)
      expect(result).to have_key(:info)
      expect(result[:info]).to have_key(:copyright)
      expect(result[:results][0][:locations][0][:latLng]).to have_key(:lat)
      expect(result[:results][0][:locations][0][:latLng]).to have_key(:lng)
    end
  end
end