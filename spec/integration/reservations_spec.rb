require 'swagger_helper'

RSpec.describe 'api/v1/reservations', type: :request do
  path 'reserves/' do
    post 'Creates a reservation' do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          date: { type: :date },
          reserved_from: { type: :date },
          reserved_until: { type: :date },
          user_id: { type: :integer },
          car_id: { type: :integer }
        },
        required: %w[date reserved_from reserved_until user_id car_id]
      }

      response '201', 'reservation created' do
        let(:reservation) do
          {
            date: 2023-01-01, reserved_from: 2023-01-01, reserved_until: 2023-01-02, user_id: 1, car_id: 1
          }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:reservation) { { name: 'foo' } }
        run_test!
      end
    end
  end
end