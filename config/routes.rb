Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}

  root 'home#index'

  get '/bags/:id/add', to: 'bags#add', as: 'bags_add'
  post '/bags/:id/add', to: 'bags#add_create'

  resources :scorecards
  resources :bags
  resources :discs
 

  resources :users do 
    resources :bags do
      resources :discs
    end
  end

  resources :users do
    resources :scorecards
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
