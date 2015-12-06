Rails.application.routes.draw do
  
  namespace :game do
    get 'stats' => 'stats#index'
    get 'stats/:id' => 'stats#stats'
  end

  resources :game_play_roles
  resources :game_plays
  resources :game_roles
  resources :games
  resources :users
  root to: 'visitors#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
