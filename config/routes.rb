Rails.application.routes.draw do
  # get '/users/auth/google_oauth2/callback'
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}
  # get 'home/index'
  root 'home#index'
  resources :discs
  resources :bags
  resources :scorecards
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
