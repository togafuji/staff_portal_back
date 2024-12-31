Rails.application.routes.draw do
  mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => '/api-docs'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # APIのベースURL
  namespace :api do
    namespace :v1 do
      # ログイン用エンドポイント
      devise_scope :user do
        post 'login', to: 'sessions#create'
        delete 'logout', to: 'sessions#destroy'
      end
      resources :bulletin_boards, only: [:index, :show, :create, :update, :destroy] do
        member do
          # PATCH /api/v1/bulletin_boards/:id/mark_as_read
          patch :mark_as_read
        end
      end
    end
  end
end
