Rails.application.routes.draw do
  resources :users, only: [:create]
  get '/signup' => 'users#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  root 'home#home'
 
end
