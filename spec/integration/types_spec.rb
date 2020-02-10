require 'swagger_helper'

describe 'Pizza Types API' do
  path '/pizza_type' do
    post 'Creates a type' do
      tags 'Pizza Types'
      consumes 'application/json', 'application/xml'
      parameter name: :type, in: :body, schema: {
          type: :object,
          properties: {
              name: {type: :string}
          },
          required: ['name']
      }

      response '201', 'type created' do
        let(:type) { {name: 'Hawaiian'} }
        run_test!
      end

      response '422', 'invalid request' do
        let(:type) { {name: ''} }
        run_test!
      end
    end
  end

  path '/pizza_type/{id}' do
    get 'Retrieves a pizza type by id' do
      tags 'Pizza Types'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :integer

      response '200', 'pizza type found' do
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

  path '/pizza_type' do
    get 'Get All pizza types' do
      tags 'Pizza Types'
      consumes 'application/json', 'application/xml'

      response(200, description: 'Return all the available pizza types') do
        let!(:pizza_types) do
          3.times do
            create(:pizza_type)
          end
        end
        run_test!
      end
    end
  end
end