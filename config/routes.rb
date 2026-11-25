Rails.application.routes.draw do

  scope module: :public do
    root to: "homes#top"

    # 新規登録
    get "users/sign_up", to: "registrations#new", as: :new_registration
    post "users", to: "registrations#create", as: :registration

    # ログイン・ログアウト
    get "users/sign_in", to: "sessions#new", as: :new_session
    post "users/sign_in", to: "sessions#create", as: :session
    delete "users/sign_out", to: "sessions#destroy", as: :destroy_session

    # パスワード再設定
    resources :passwords, param: :token

    resources :movies, only: [:show]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
