require 'rails_helper'

RSpec.describe 'Pizza Types API', type: :request do
  # initialize test data
  let!(:pizza_types) { create_list(:pizza_type, 10) }
  let(:pizza_type_id) { pizza_types.first.id }

  # Test suite for GET /pizza_type
  describe 'GET /pizza_type EndPoint' do
    # make HTTP get request before each example
    before { get '/pizza_type' }

    it 'returns pizza types' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /pizza_type/:id
  describe 'GET /pizza-type/:id End Point' do
    before { get "/pizza_type/#{pizza_type_id}" }

    context 'when the record exists' do
      it 'returns the todo' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(pizza_type_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:pizza_type_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find PizzaType/)
      end
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

  # Test suite for PUT /pizza_type/:id
  describe 'PUT /pizza_type/:id End Point' do
    let(:valid_attributes) { {name: 'Brazilian'} }

    context 'when the record exists' do
      before { put "/pizza_type/#{pizza_type_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /pizza_type/:id
  describe 'DELETE /pizza_type/:id EndPoint' do
    before { delete "/pizza_type/#{pizza_type_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end