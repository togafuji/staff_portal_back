class Api::V1::SessionsController < Devise::SessionsController
  respond_to :json

  private

  # ログイン時のレスポンス
  def respond_with(resource, _opts = {})
    render json: {
      token: current_token,
      username: resource.username
      # userIcon: resource.user_icon_url # ユーザーのアイコンURL
    }, status: :ok
  end

  # ログアウト時のレスポンス
  def respond_to_on_destroy
    head :no_content
  end

  # トークンを取得するメソッド
  def current_token
    # JWTトークンを取得する際のワードンの環境変数を確認
    token = request.env['warden-jwt_auth.token'] # ここでトークンを取得
    if token
      token
    else
      raise "JWT token could not be found" # トークンが見つからない場合のエラーメッセージ
    end
  end
end
