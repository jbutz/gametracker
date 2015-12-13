Rails.application.routes.draw do
  
  resources :win_conditions
  
  

  resources :game_play_roles
  resources :game_plays
  resources :game_roles
  resources :games
  resources :users
  root to: 'visitors#index'
  
  get 'stats' => 'stats#index'
  get 'stats/:id' => 'stats#stats'
  
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
