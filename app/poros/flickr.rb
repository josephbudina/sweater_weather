class Flickr
  attr_reader :id,
              :data

  def initialize(data)
    @id = nil
    @data = data
  end

  def self.photo_info_object(id)
    photo_info = FlickrService.get_photo_info(id)
    Flickr.new(photo_info)
  end
end