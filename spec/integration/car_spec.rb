require 'swagger_helper'
describe 'Car API' do
  path '/api/v1/cars' do
    post 'Creates a car' do
      tags 'Car'
      consumes 'application/json', 'application/xml'
      parameter name: :car, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer },
          model: { type: :string },
          release_year: { type: :integer },
          color: { type: :string },
          transmission: { type: :string },
          price: { type: :integer },
          seats: { type: :integer},
          wheel_drive: { type: :string },
          image_link: { type: :string },
          user_id: { type: :integer }
        },
        required: %w[id name car_image bike_type description brand daily_rate user_id]
      }
      response '201', 'CAr created' do
        let(:car) do
          { name: 'AlusiA', bike_image: "https://imgd.aeplcdn.com/1280x720/n/cw/ec/43482/sp-125-right-front-three-quarte
r-2.jpeg?isig=0&q=80", bike_type: 'HNDA', description: 'Tption', brand: 'This Brand', daily_rate: '2000', user_id: 1 }
        end
        run_test!
      end
      response '422', 'invalid request' do
        let(:car) { { name: 'foo' } }
        run_test!
      end
    end
  end
  path '/api/v1/cars/{id}' do
    get 'Retrieves a car' do
      tags 'Cars'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string
      response '200', 'name found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 bike_image: { type: :string },
                 bike_type: { type: :string },
                 description: { type: :string },
                 brand: { type: :string },
                 daily_rate: { type: :string },
                 user_id: { type: :integer }
               },
               required: %w[id name bike_image bike_type description brand daily_rate user_id]
        let(:id) do
          Bike.create(name: 'AlusiA', bike_image: "https://imgd.aeplcdn.com/1280x720/n/cw/ec/43482/sp-125-right-front-three-quarte
r-2.jpeg?isig=0&q=80", bike_type: 'HNDA', description: 'Tption', brand: 'This Brand', daily_rate: '2000', user_id: 1).id
        end
        run_test!
      end
      response '404', 'car not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end