class Geocode
  attr_reader :lat,
              :lng

  def initialize(data)
    @lat = data[:lat]
    @lng = data[:lng]
  end

  def self.lat_lng_object(city, state)
    geo = GeocodeService.get_geocode_data(city, state)[:results][0][:locations][0][:latLng]
    Geocode.new(geo)
  end
end