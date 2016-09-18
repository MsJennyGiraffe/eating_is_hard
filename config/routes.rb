Rails.application.routes.draw do
  root "home#index"

  resources :recipes, only: [:index]
  resources :users, only: [:show]

  get '/auth/facebook', as: :facebook_login
  get '/auth/facebook/callback', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
end
