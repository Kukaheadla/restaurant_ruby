Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/', to: 'users#new'

  get '/login', to: 'sessions#login'

  post '/session', to: 'sessions#create'
  delete '/session', to: 'sessions#destroy'

  get '/dishes', to: 'dishes#new'
  post '/dishes', to: 'dishes#create'
  get '/list', to: 'dishes#list'

  get 'tables', to: 'tables#edit'
  post 'tables', to: 'tables#create'
  get '/tables/:id', to: 'tables#summary'
  post '/tables/:id/dish', to: 'tables#add_order'
  post '/tables/:id/tb_dish_delete', to: 'tables#delete_order'
  post '/tables/:id/paid', to: 'tables#paid'

  get '/home', to: 'pages#home'
  root 'pages#home'
end
