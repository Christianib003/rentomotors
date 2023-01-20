require 'swagger_helper'

RSpec.describe 'api/v1/users', type: :request do
  path 'api/v1/users' do
    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          encrypted_password: { type: :string },
          email: { type: :string },
          name: { type: :string },
        },
        required: %w[username]
      }

      response '201', 'user created' do
        let(:user) do
          {
            username: 'microverse'
          }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { id: 1 } }
        run_test!
      end
    end
    get 'List All users' do
      tags 'Users'
      consumes 'application/json'
      response '200', 'users displayed' do
        run_test!
      end
    end
  end
end