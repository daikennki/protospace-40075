Rails.application.routes.draw do
  devise_for :users
  resources :prototypes
  resources :comments, only: :create
  resources :users, only: :show
  root to: "prototypes#index"
end
