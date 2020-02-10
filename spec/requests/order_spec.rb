require 'rails_helper'

RSpec.describe 'Order API', type: :request do
  # Initialize the test data
  let!(:orders) { create_list(:order, 20) }

  # Test suite for GET /order
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

  # Test suite for POST /order
  describe 'POST /order EndPoint' do
    # valid payload
    let(:valid_attributes) { {'type_id': 1, 'size_id': 1, 'cheese_id': 1, 'sauce_id': 1, 'crust_id': 1, status_id: 1, 'slices': 12} }

    context 'when the request is valid' do
      before { post '/order', params: valid_attributes }

      it 'creates an order' do
        expect(json['slices']).to eq(12)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/order', params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(404)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Couldn't find Size without an/)
      end
    end
  end
end