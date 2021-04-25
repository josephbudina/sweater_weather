require 'rails_helper'

RSpec.describe FlickrService, type: :model do

  describe "#get_data" do
    it "should return json for the flickr api", :vcr do
      result = FlickrService.get_search_data("denver,co")

      expect(result.class).to eq(Hash)
      expect(result).to have_key(:photos)
    end
    
    it "should return json for the flickr api img id", :vcr do
      result = FlickrService.get_photo_info("51123309253")

      expect(result.class).to eq(Hash)
      expect(result).to have_key(:photo)
    end
  end
end