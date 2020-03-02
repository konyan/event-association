Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'sessions#new'
  get '/signin', to:'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signup' , to: 'users#new'
  post '/signup' , to: 'users#create'
  delete '/signout', to: 'sessions#destroy'

  resources :users
  resources :events
end
