require 'rails_helper'

RSpec.describe 'Api::V1::Salaries API', type: :request do

  describe 'GET /salaries' do
    valid_params = {
                  destination: "Denver,Co"
    }

    it 'returns items' do
      get api_v1_salaries_path, params: valid_params
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)
      expect(json).not_to be_empty
      binding.pry
    end
  end
end