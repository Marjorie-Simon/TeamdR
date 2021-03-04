Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: :index do
    resources :events, only: [ :new, :create ]
  end

  resources :daily_statuses, only: [ :index, :new, :create, :update, :update_all ]

  resources :events, only: [ :index, :new, :create, :destroy, :update, :approve, :decline ]

  resources :ratings, only: :create

  resources :dashboard, only: :dashboard
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
