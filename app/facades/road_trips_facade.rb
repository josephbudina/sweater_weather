class RoadTripsFacade
  def self.get_route(origin, destination)
    trip = GeocodeService.get_route(origin, destination)
    RoadTrip.new(trip, origin, destination)
  end
end