require 'rails_helper'

RSpec.describe 'Api::V1::Sessions API', type: :request do

  describe 'post /users' do
    it 'creates a user' do
      @user = User.create(email: "a@example.com", password: "password", password_confirmation: "password")
      post api_v1_sessions_url, params: {email: "a@example.com", password: "password", password_confirmation: "password"}
      json = JSON.parse(response.body, symbolize_names: true)
binding.pry
      expect(response.status).to eq(201)
      expect(json).not_to be_empty
      expect(json[:data].size).to eq(3)
      expect(json[:data][:attributes].size).to eq(2)
      expect(json[:data][:attributes].keys).to eq([:email, :password, :api_key])
    end
  end
end