require 'rails_helper'

RSpec.describe RoadTripsFacade, type: :model do

  describe "#travel_time" do
    it "should get route length", :vcr do
      result = RoadTripsFacade.get_route("denver,co", "chicago,il")

      expect(result.class).to eq(RoadTrip)
      expect(result.start_city).to eq("denver,co")
      expect(result.end_city).to eq("chicago,il")
    end
  
    describe "#travel_time", :vcr do
      it "sad path" do
        result = RoadTripsFacade.get_route("colorado", "london")

        expect(result.class).to eq(RoadTrip)
        expect(result.start_city).to eq("colorado")
        expect(result.end_city).to eq("london")
        expect(result.travel_time).to eq("impossible route")
      end
      
      describe "#travel_time_48", :vcr do
        it "over 48 hours path" do
          result = RoadTripsFacade.get_route("mexico city", "maine")

          expect(result.class).to eq(RoadTrip)
          expect(result.start_city).to eq("mexico city")
          expect(result.end_city).to eq("maine")
        end
      end
    end
  end
end
