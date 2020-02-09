# spec/integration/pets_spec.rb
require 'swagger_helper'

describe 'Types API' do

  path '/api/v1/types' do

    post 'Creates a type' do
      tags 'Types'
      consumes 'application/json', 'application/xml'
      parameter name: :type, in: :body, schema: {
          type: :object,
          properties: {
              name: {type: :string}
          },
          required: ['name']
      }

      response '201', 'pet created' do
        let(:type) { {name: 'Hawaiian'} }
        run_test!
      end

      response '422', 'invalid request' do
        let(:type) { {name: ''} }
        run_test!
      end
    end
  end

  path '/api/v1/types/{id}' do

    get 'Retrieves a pet' do
      tags 'Pets'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'name found' do
        schema type: :object,
               properties: {
                   id: {type: :integer},
                   name: {type: :string}
               },
               required: ['id', 'name']

        let(:id) { Type.create(name: 'Hawaiian').id }
        run_test!
      end
      response '404', 'type not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end