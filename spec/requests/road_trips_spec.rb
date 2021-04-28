require 'rails_helper'

RSpec.describe 'Api::V1::RoadTripsController API', type: :request do

  describe 'GET /road_trips' do
    it 'returns trip' do
      post api_v1_users_url, params: {email: "a@example.com", password: "password", password_confirmation: "password"}
      json = JSON.parse(response.body, symbolize_names: true)
      post api_v1_road_trips_path, params: {origin: "Denver,CO", destination: "Pueblo,CO", api_key: json[:data][:attributes][:api_key]}, as: :json
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)
      expect(json).not_to be_empty
      expect(json[:data].size).to eq(3)
      expect(json[:data][:attributes].size).to eq(4)
      expect(json[:data][:attributes].keys).to eq([:start_city, :end_city, :travel_time, :weather_at_eta])
    end
  end
end