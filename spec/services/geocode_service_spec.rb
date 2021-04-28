require 'rails_helper'

RSpec.describe GeocodeService, type: :model do

  describe "#get_data", :vcr do
    it "should return json for for geocode api", :vcr do
      result = GeocodeService.get_geocode_data("denver,co")

      expect(result.class).to eq(Hash)
      expect(result).to have_key(:info)
      expect(result[:info]).to have_key(:copyright)
      expect(result[:results][0][:locations][0][:latLng]).to have_key(:lat)
      expect(result[:results][0][:locations][0][:latLng]).to have_key(:lng)
    end
    
    it "should return 400", :vcr do
      result = GeocodeService.get_geocode_data("")

      expect(result.class).to eq(Hash)
      expect(result[:info][:statuscode]).to eq(400)
      expect(result[:info]).to have_key(:copyright)
      expect(result).to_not have_key(:lat)
      expect(result).to_not have_key(:lng)
    end
  end

  describe "#get_route", :vcr do
    it "gets route for road trip" do
      result = GeocodeService.get_route("Denver,CO", "Pueblo,CO")
      
      expect(result.class).to eq(Hash)
      expect(result[:route]).to have_key(:formattedTime)
    end

    it 'cant take an empty string' do
      result = GeocodeService.get_route("", "")

      expect(result.class).to eq(Hash)
      expect(result[:info][:messages]).to eq(["At least two locations must be provided."])
    end
  end
end