Rails.application.routes.draw do

  resources :users, only: [:new, :create]

  root 'sessions#new'
  get '/login', to: 'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy', as: 'logout'
  get '/welcome', to: 'welcome#home', as: 'welcome'

end
