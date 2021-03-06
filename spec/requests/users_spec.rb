require 'rails_helper'

RSpec.describe 'Api::V1::User API', type: :request do

  describe 'post /users' do
    it 'creates a user' do
      post api_v1_users_url, params: {email: "a@example.com", password: "password", password_confirmation: "password"}
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(201)
      expect(json).not_to be_empty
      expect(json[:data].size).to eq(3)
      expect(json[:data][:attributes].size).to eq(2)
      expect(json[:data][:attributes].keys).to eq([:email, :api_key])
      expect(json[:data][:attributes][:email]).to eq( "a@example.com")
      expect(json[:data][:attributes][:api_key].class).to eq(String)
    end

    it 'returns 404', :vcr do
      post api_v1_users_path
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(json).not_to be_empty
      expect(json).to eq(["Password can't be blank", "Password can't be blank", "Email can't be blank"])
    end
  end
end