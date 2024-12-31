RSpec.describe 'api/v1/bulletin_boards', type: :request do
  path '/api/v1/bulletin_boards/{id}' do
    # パラメータの定義
    parameter name: :id, in: :path, type: :string, description: '掲示板ID'
    parameter name: :bulletin_board, in: :formData, schema: {
      type: :object,
      properties: {
        title: { type: :string },
        content: { type: :string },
        'files[]': {
          type: :array,
          items: { type: :string, format: :binary }
        }
      }
    }

    describe 'Successful update' do
      patch('update bulletin_board') do
        tags 'BulletinBoards'
        consumes 'multipart/form-data'
        produces 'application/json'

        response(200, 'updated') do
          schema '$ref' => '#/components/schemas/BulletinBoard'
          run_test!
        end
      end
    end

    describe 'Unprocessable entity' do
      patch('update bulletin_board') do
        tags 'BulletinBoards'
        consumes 'multipart/form-data'
        produces 'application/json'

        response(422, 'unprocessable entity') do
          run_test!
        end
      end
    end
  end
end
