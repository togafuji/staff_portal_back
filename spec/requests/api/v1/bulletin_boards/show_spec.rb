require 'swagger_helper'

RSpec.describe 'api/v1/bulletin_boards', type: :request do
  path '/api/v1/bulletin_boards/{id}' do
    parameter name: :id, in: :path, type: :string, description: '掲示板ID'

    get('show bulletin_board') do
      tags 'BulletinBoards'
      produces 'application/json'

      response(200, 'successful') do
        schema '$ref' => '#/components/schemas/BulletinBoard'
        run_test!
      end

      response(404, 'not found') do
        run_test!
      end
    end
  end
end
