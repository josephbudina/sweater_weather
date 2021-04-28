require 'rails_helper'

RSpec.describe 'Api::V1::Backgrounds API', type: :request do

  describe 'GET /Backgrounds' do
    valid_params = {
                  location: "Denver,Co"
    }

    it 'returns backgrounds', :vcr do
      get api_v1_backgrounds_path, params: valid_params
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)
      expect(json).not_to be_empty
      expect(json[:data].size).to eq(3)
      expect(json[:data][:attributes].size).to eq(2)
      expect(json[:data].keys).to eq([:id, :type, :attributes])
      expect(json[:data][:attributes].keys).to eq([:image, :credit])
    end

    it 'returns 404', :vcr do
      get api_v1_backgrounds_path
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(json).not_to be_empty
      expect(json[:error]).to eq("Invalid Parameters")
    end
  end
end