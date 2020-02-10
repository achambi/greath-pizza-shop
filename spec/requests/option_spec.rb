require 'rails_helper'

RSpec.describe 'Option API', type: :request do
  # Initialize the test data
  let!(:options) { create_list(:option, 20) }

  # Test suite for GET /pizza_type
  describe 'GET /option EndPoint' do
    # make HTTP get request before each example
    before { get '/option' }

    it 'returns options' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(20)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for POST /pizza-type
  describe 'POST /pizza_type EndPoint' do
    # valid payload
    let(:valid_attributes) { {name: 'Hawaiian'} }

    context 'when the request is valid' do
      before { post '/pizza_type', params: valid_attributes }

      it 'creates a pizza type' do
        expect(json['name']).to eq('Hawaiian')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/pizza_type', params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end
end