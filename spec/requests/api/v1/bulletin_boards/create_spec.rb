require 'swagger_helper'

RSpec.describe 'api/v1/bulletin_boards', type: :request do
  path '/api/v1/bulletin_boards' do
    post('create bulletin_board') do
      tags 'BulletinBoards'
      consumes 'multipart/form-data'
      produces 'application/json'

      parameter name: :bulletin_board, in: :formData, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          content: { type: :string },
          'files[]': {
            type: :array,
            items: { type: :string, format: :binary },
            description: '複数ファイルのアップロード'
          }
        },
        required: %w[title content]
      }

      response(201, 'created') do
        schema '$ref' => '#/components/schemas/BulletinBoard'
        run_test!
      end

      response(422, 'unprocessable entity') do
        run_test!
      end
    end
  end
end
