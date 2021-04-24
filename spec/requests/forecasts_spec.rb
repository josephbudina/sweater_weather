require 'rails_helper'

RSpec.describe 'Api::V1::Forecasts API', type: :request do

  describe 'GET /forcasts' do
    valid_params = {
                  location: "Denver,Co"
    }

    it 'returns items', :vcr do
      get api_v1_forecasts_path, params: valid_params
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)
      expect(json).not_to be_empty
      expect(json[:data].size).to eq(3)
      expect(json[:data][:attributes][:current_weather].size).to eq(10)
      expect(json[:data][:attributes][:daily_weather].size).to eq(5)
      expect(json[:data][:attributes][:hourly_weather].size).to eq(8)
      expect(json[:data][:attributes][:current_weather]).not_to be_empty
      expect(json[:data][:attributes][:daily_weather]).not_to be_empty
      expect(json[:data][:attributes][:hourly_weather]).not_to be_empty
    end
  end
end