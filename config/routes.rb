Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: :index do
    resources :events, only: [ :new, :create ]
  resources :daily_statuses, only: [ :index, :create, :update ]
  resources :events, only: [ :index, :approve, :decline ]
  resources :ratings, only: :create
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
