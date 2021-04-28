require 'rails_helper'

RSpec.describe 'Flickr' do

  describe 'Flickr poro' do
    it '#photo_info_object', :vcr do
      photo = Flickr.photo_info_object(2120630062)

      expect(photo.data[:photo][:id]).to eq("2120630062")
      expect(photo.id).to eq(nil)
    end
  end
end