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
            date: 2023 - 0o1 - 0o1, reserved_from: 2023 - 0o1 - 0o1, reserved_until: 2023 - 0o1 - 0o2, user_id: 1, car_id: 1
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

  path 'api/v1/reservations' do
    get 'Retrieves all reservations' do
      tags 'Reservations'
      produces 'application/json'
      response '200', 'reservation found' do
        schema type: :object,
               properties: {
                 date: { type: :date },
                 reserved_from: { type: :date },
                 reserved_until: { type: :date },
                 user_id: { type: :integer },
                 car_id: { type: :integer }
               },
               required: %w[date reserved_from reserved_until user_id car_id]

        let(:id) do
          Reservation.create(date: 2023 - 0o1 - 0o1, reserved_from: 2023 - 0o1 - 0o1, reserved_until: 2023 - 0o1 - 0o2, user_id: 1,
                             car_id: 1).id
        end
        run_test!
      end

      response '404', 'reservation not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path 'api/v1/reservations/{id}' do
    get 'Retrieves a reservation' do
      tags 'Reservations'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'reservation found' do
        schema type: :object,
               properties: {
                 date: { type: :date },
                 reserved_from: { type: :date },
                 reserved_until: { type: :date },
                 user_id: { type: :integer },
                 car_id: { type: :integer }
               },
               required: %w[date reserved_from reserved_until user_id car_id]

        let(:id) do
          Reservation.create(date: 2023 - 0o1 - 0o1, reserved_from: 2023 - 0o1 - 0o1, reserved_until: 2023 - 0o1 - 0o2, user_id: 1,
                             car_id: 1).id
        end
        run_test!
      end

      response '404', 'reservation not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path 'api/v1/reservations/{id}' do
    delete 'Deletes a reservation' do
      tags 'Reservations'
      parameter name: :id, in: :path, type: :string

      response '204', 'reservation deleted' do
        let(:id) do
          Reservation.create(date: 2023 - 0o1 - 0o1, reserved_from: 2023 - 0o1 - 0o1, reserved_until: 2023 - 0o1 - 0o2, user_id: 1,
                             car_id: 1).id
        end
        run_test!
      end
      response '404', 'reservation not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
