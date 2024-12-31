# すべてのコントローラーで共通する設定やメソッドを提供
class ApplicationController < ActionController::API
  respond_to :json

  include Devise::Controllers::Helpers
  before_action :authenticate_user!

  # Devise の認証失敗時のレスポンスをカスタマイズ
  rescue_from Devise::FailureApp, with: :handle_auth_failure

  private

  def handle_auth_failure(_exception)
    render json: { error: 'Invalid email or password' }, status: :unauthorized
  end
end
