require 'rails_helper'

RSpec.describe 'Api::V1::RoadTripsController API', type: :request do

  describe 'GET /road_trips' do
    it 'returns trip' do
      post api_v1_road_trips_path, params: {origin: "Denver,CO", destination: "Pueblo,CO", api_key: "jgn983hy48thw9begh98h4539h4"}
      json = JSON.parse(response.body, symbolize_names: true)
      binding.pry
      expect(response.status).to eq(200)
      expect(json).not_to be_empty
      expect(json[:data].size).to eq(3)
      expect(json[:data][:attributes].size).to eq(3)
      expect(json[:data][:attributes][:salaries].size).to eq(7)
    end
  end
end