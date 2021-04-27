class BackgroundsFacade

  def self.get_photo_id(location)
    id = FlickrService.get_search_data(location)[:photos][:photo][0][:id]
  end

  def self.photo(location)
    id = get_photo_id(location)
    Flickr.photo_info_object(id)
  end

  def self.image_info(location)
    photo(location)

    image = {
      location: location,
      image_url: photo(location).data[:photo][:urls][:url][0][:_content],
      credit: {
        source: "Flickr.com",
        author: photo("denver,co").data[:photo][:owner][:username],
      }
    }

    Background.new(image)
  end
end