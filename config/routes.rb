Rails.application.routes.draw do
  devise_for :users do
    resources :activities, only: [:new, :create]
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :activities do
    resources :reviews, only: [ :new, :create, :edit, :update, :show, :destroy]
    resources :bookings, only: [ :new, :create]
  end
  resources :bookings, except: [ :new, :create]
  resources :categories, only: [:index, :show]
  get "host", to: "pages#host"
  get "my_activities", to: "activities#user_activities", as: :user_activities
end
