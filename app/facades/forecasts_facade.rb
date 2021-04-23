class ForecastsFacade

  def self.lat_lng(location)
    geo = GeocodeService.get_geocode_data(location)[:results][0][:locations][0][:latLng]
  end
end