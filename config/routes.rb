Rails.application.routes.draw do
  resources :meetings
  get 'charts/completed_tasks'
  devise_for :users
  root to: 'pages#home'
  resources :users, only: :index do
    resources :events, only: [ :new, :create ]
  end

  resources :daily_statuses, only: [ :index, :new, :create, :update, :update_all ]

  resources :events, only: [ :index, :new, :create ] do
    member do
      patch :approve
      patch :decline
    end
  end

  resources :ratings, only: :create

  get '/dashboard', to: 'dashboards#dashboard'

  # get '/users/:id/events', to: 'events'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
