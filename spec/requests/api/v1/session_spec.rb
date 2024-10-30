require 'rails_helper'
require 'swagger_helper'

RSpec.describe 'API V1 Sessions', type: :request do
  path '/api/v1/login' do
    post 'ログイン' do
      tags 'Authentication'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string, example: 'user@example.com' },
          password: { type: :string, example: 'password123' }
        },
        required: %w[email password]
      }

      response '200', 'ログイン成功' do
        schema type: :object,
          properties: {
            token: { type: :string },
            username: { type: :string }
          }

        let(:user) { { email: 'user@example.com', password: 'password123' } }
        run_test!
      end

      response '401', '認証失敗' do
        schema type: :object,
          properties: {
            error: { type: :string, example: 'Invalid email or password' }
          }

        let(:user) { { email: 'wrong@example.com', password: 'wrongpassword' } }
        run_test!
      end
    end
  end

  path '/api/v1/logout' do
    delete 'ログアウト' do
      tags 'Authentication'
      security [bearerAuth: []]
      response '204', 'ログアウト成功' do
        run_test!
      end

      response '401', '認証エラー' do
        schema type: :object,
          properties: {
            error: { type: :string, example: 'Invalid or missing token' }
          }

        run_test!
      end
    end
  end
end
