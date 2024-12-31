require 'swagger_helper'

RSpec.describe 'api/v1/bulletin_boards', type: :request do
  path '/api/v1/bulletin_boards' do
    get('list bulletin_boards') do
      tags 'BulletinBoards'
      produces 'application/json'

      response(200, 'successful') do
        schema type: :array,
               items: {
                 '$ref' => '#/components/schemas/BulletinBoard'
               }

        run_test!
      end
    end
  end
end
