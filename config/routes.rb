Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/home'

  post 'sessions/create'

  get 'sessions/destroy'

   get 'users/new'
   post 'users/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
