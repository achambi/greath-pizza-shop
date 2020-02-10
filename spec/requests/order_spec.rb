require 'rails_helper'

RSpec.describe 'Order API', type: :request do
  # Initialize the test data
  let!(:orders) { create_list(:order, 20) }

  # Test suite for GET /pizza_type
  describe 'GET /order EndPoint' do
    # make HTTP get request before each example
    before { get '/order' }

    it 'returns orders' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(20)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end