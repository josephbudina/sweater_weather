class FlickrService
  def self.get_search_data(location)
    response = conn.get("/services/rest/?method=flickr.photos.search&api_key=#{ENV["FLICK_KEY"]}&text=#{location}&per_page=1&format=json&nojsoncallback=1")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_photo_info(photo_id)
    response = conn.get("/services/rest/?method=flickr.photos.getInfo&api_key=#{ENV["FLICK_KEY"]}&photo_id=#{photo_id}&format=json&nojsoncallback=1")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    @conn ||= Faraday.new(url: 'https://www.flickr.com')
  end
end