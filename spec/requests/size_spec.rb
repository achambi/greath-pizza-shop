require 'rails_helper'

RSpec.describe 'Size API', type: :request do
  # Initialize the test data
  let!(:sizes) { create_list(:size, 4) }

  # Test suite for GET /pizza_type
  describe 'GET /size EndPoint' do
    # make HTTP get request before each example
    before { get '/size' }

    it 'returns sizes' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(4)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end