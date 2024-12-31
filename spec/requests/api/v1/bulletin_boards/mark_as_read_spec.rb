require 'swagger_helper'

RSpec.describe 'api/v1/bulletin_boards', type: :request do
  path '/api/v1/bulletin_boards/{id}/mark_as_read' do
    parameter name: :id, in: :path, type: :string, description: '掲示板ID'

    patch('mark bulletin_board as read') do
      tags 'BulletinBoards'
      produces 'application/json'

      response(200, 'marked as read') do
        schema type: :object,
               properties: {
                 message: { type: :string }
               }
        run_test!
      end

      response(422, 'unprocessable entity') do
        run_test!
      end
    end
  end
end
