class GeocodeService
  def self.get_geocode_data(location)
    response = conn.get("/geocoding/v1/address?key=#{ENV["GEOCODE_KEY"]}&location=#{location}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    @conn ||= Faraday.new(url: 'http://www.mapquestapi.com')
  end
end