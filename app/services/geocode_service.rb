class GeocodeService
  def self.get_geocode_data(location)
    response = conn.get("/geocoding/v1/address?key=#{ENV["GEOCODE_KEY"]}&location=#{location}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_route(from, to)
    response = conn.get("/directions/v2/route?key=#{ENV["GEOCODE_KEY"]}&from=#{from}&to=#{to}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    @conn ||= Faraday.new(url: 'http://www.mapquestapi.com')
  end
end