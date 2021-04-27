require 'rails_helper'

RSpec.describe RoadTripsFacade, type: :model do

  describe "#travel_time" do
    it "should get route length", :vcr do
      result = RoadTripsFacade.get_route("denver,co", "chicago,il")

      expect(result.class).to eq(RoadTrip)
      expect(result.start_city).to eq("denver,co")
      expect(result.end_city).to eq("chicago,il")
    end
  end
end
