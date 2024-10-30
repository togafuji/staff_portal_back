Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               sessions: 'sessions'
             }

  # APIのベースURL
  namespace :api do
    namespace :v1 do
      # ログイン用エンドポイント
      devise_scope :user do
        post 'login', to: 'sessions#create'
        delete 'logout', to: 'sessions#destroy'
      end
    end
  end
end
